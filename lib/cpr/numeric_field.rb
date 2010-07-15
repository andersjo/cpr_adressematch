# coding: utf-8
module Cpr
  class NumericField < Field
    def fill_char
      "0"
    end

    def cast_for_read(val)
      val.to_i
    end

    def cast_for_write(val)
      str = "%0#{length}d" % val
      raise "Value #{val} overflows length #{length}" if str.length > length
      str
    end

    def typed_pattern
      "\\d{#{length}}"
    end

  end
end
