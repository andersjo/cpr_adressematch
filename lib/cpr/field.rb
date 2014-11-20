# coding: utf-8
module Cpr
  class Field
    attr_reader :name, :range, :default
    def initialize(name, range, opts = {})
      @name = name
      @range = range
      @default = opts[:default]
    end

    def read(raw)
      cast_for_read(raw[range])
    end

    def write(raw, value)
      raw[range] = cast_for_write(value).encode(Encoding::ISO_8859_1, undef: :replace, invalid: :replace)[0...length]
      raw
    end

    def fill
      if @default != nil
        cast_for_write @default
      else
        " "*length
      end
    end

    def length
      @range.max - @range.begin + 1
    end

    def pattern
      if default
        cast_for_write(default)
      else
        typed_pattern
      end
    end
    
    def self.create_type(type, *args)
      klass = case type
      when 'A' then AlphanumericField
      when 'N' then NumericField
      else raise "Invalid value for type '#{type}'"
      end
      klass.new(*args)
    end

  end
end
