# coding: utf-8
module Cpr
  class RespDocument
    attr_accessor :rows
    def initialize(rows = [])
      @rows = rows
    end

    def self.from_lines(lines)
      rows = []
      lines.each do |line|
        row = Row.parse(line)
        raise "Parse error while processing row:\n\t'#{line}'\n\tlen:#{line.length}" if row.nil?
        rows << row
      end
      RespDocument.new(rows)
    end

    def self.from_file(filename)
      file = File.open(filename, "r:iso-8859-1")
      from_lines(file.readlines.map(&:strip))
    end

    def groups
      if @groups.nil?
        @groups = rows.group_by {|row| row.class.to_s.split("::").last }
        @groups.default = []
      end
      @groups
    end


  end
end