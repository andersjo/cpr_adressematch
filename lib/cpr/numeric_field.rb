# coding: utf-8
module Cpr
  class NumericField < Field
    def cast_for_read(val)
      val.to_i if val =~ /^\d+$/
    end

    def cast_for_write(val)
      if val.nil?
        fill
      else
        str = "%0#{length}d" % val
        raise "Value #{val} overflows length #{length}" if str.length > length
        str
      end
    end

  end
end
