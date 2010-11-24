# coding: utf-8
module Cpr
  class AlphanumericField < Field
    def cast_for_read(val)
      val.strip.encode("utf-8")
    end

    def cast_for_write(val)
      val.ljust(length)
    end

  end
end
