# coding: utf-8
module Cpr
  class ReqDocument
    attr_reader :rows
    def initialize
      @rows = []
    end

    def data
      @rows.map(&:data)*"\r\n"
    end

  end
end
