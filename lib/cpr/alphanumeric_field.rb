# coding: utf-8
module Cpr
  class AlphanumericField < Field
    def fill_char
      " "
    end

    def cast_for_read(val)
      val.strip.encode("utf-8")
    end

    def cast_for_write(val)
      val.ljust(length, fill_char)
    end

    def typed_pattern
      ".{#{length}}"
    end
  end
end
