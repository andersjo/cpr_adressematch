# coding: utf-8
require 'ostruct'
require 'nokogiri'

module Cpr
  class FieldSpec < OpenStruct
    def self.parse_from_tr(tr)
      #      0     1      2        3             4             5
      # Feltnavn|Format|Længde|Record pos|Indhold i feltet|Krævede felter
      #
      # Record pos begins at 1
      tds = tr.xpath("TD").map {|td| td.content.strip }
      unless tds[0] == '' or tds[0] == "Recordlængde"
        FieldSpec.new(:name => tds[0],
          :type => tds[1],
          :range => (tds[3].to_i-1)..(tds[3].to_i-2 + tds[2].to_i),
          :default => extract_default(tds[4]))
      end
    end

    def self.extract_default(text)
      if text =~ /^(\d+)$/
        $1.to_i
      end
    end

    def field_def
      str = %{field '#{name}', '#{type}', #{range}}
      str += %{, :default => '#{default}'} if default
      str
    end


    def to_s
      "#{name} (#{type}) #{range}: #{default}"
    end
  end
  class RowSpec < OpenStruct
    def self.parse_from_table(table)
      RowSpec.new(:name => table["name"],
        :title => table["title"],
        :fields => table.xpath("TR[position() != 1]").map {|tr| FieldSpec.parse_from_tr(tr)}.compact)
    end

    def class_def(module_name, class_name)
      <<DEF
# coding: utf-8
module #{module_name}
class #{class_name} < Cpr::Row
\ttitle '#{title}'

#{field_defs}
end
end
DEF
    end

    def field_defs
      fields.map {|field| "\t#{field.field_def}" }*"\n"
    end

    def to_s
      "#{title} - #{name}\n" +
        fields.map {|field| "\t#{field}" }*"\n"
    end
  end

  class ClassGenerator
    def initialize(prefix, filename)
      @prefix = prefix
      @filename = filename
    end

    def generate
      rows.each do |row|
        filename = "lib/cpr/#{@prefix}/#{row.name}.rb"
        File.open(filename, 'w') do |file|
          file << row.class_def("Cpr::#{@prefix.capitalize}", row.name)
        end
      end
    end
    
    def rows
      doc = Nokogiri::XML.parse(File.read(@filename))
      (doc / "//Table").map do |table|
        RowSpec.parse_from_table(table)
      end
    end
  end
end