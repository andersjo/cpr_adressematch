# coding: utf-8
require 'pathname'
module Cpr
  class Row
    include Kunderefnr
    attr_reader :data
    def initialize(data = nil)
      if data
        @data = data
      else
        @data = self.class.fill
      end
    end

    def [](fieldname)
      self.class.field_by_name(fieldname).read(@data)
    end

    def []=(fieldname, value)
      self.class.field_by_name(fieldname).write(@data, value)
    end

    def content
      h = {}
      self.class.fields.each do |field|
        h[field.name] = self[field.name]
      end
      h
    end

    class << self
      def title(title)
        @title = title
      end

      def create(fields_with_vals = {})
        instance = new
        fields_with_vals.each do |key,val|
          instance[key] = val
        end
        instance
      end

      def field(fieldname, type, range, opts = {})
        @fields ||= []
        @fields_map ||= {}
        check_contiguous!(fieldname, range)
        @fields << Cpr::Field.create_type(type, fieldname, range, opts)
        @fields_map[fieldname] = @fields.last
      end

      def fields
        @fields
      end

      def field_by_name(fieldname)
        @fields_map[fieldname] or raise "No field by name '#{fieldname}"
      end

      def length
        @fields.last.range.last + 1 unless @fields.empty?
      end

      def fill
        @fields.map(&:fill).join
      end

      def parses?(str)
        f = @fields_map['Recordtype']
        f && str.start_with?(f.fill) && str.length == length
      end

      def parse(str)
        load_subclasses if @subclasses.nil?
        parser = @subclasses.find {|subclass| subclass.parses? str }
        parser.new(str) if parser
      end

      def inherited(subclass)
        @subclasses ||= []
        @subclasses << subclass
      end

      private
      def load_subclasses
        class_dir = Pathname.new(__FILE__).dirname + "adressematch"
        class_dir.children.select {|file| file.to_s.end_with? ".rb" }.each do |file|
          require file.to_s
        end
      end

      def check_contiguous!(fieldname, range)
        if @fields.empty?
          raise "First field '#{fieldname}' should start at index 0" unless range.begin == 0
        else
          last_end = @fields.last.range.max
          raise "Field '#{fieldname}' leaves gap" if range.begin > (last_end+1)
          raise "Field '#{fieldname}' overlaps" if range.begin < (last_end+1)
        end
      end
    end
  end
end
