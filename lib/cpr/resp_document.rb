# coding: utf-8
module Cpr
  class RespDocument
    attr_accessor :rows
    def initialize(rows = [])
      @rows = rows
    end

    def self.from_file(filename)
      rows = []
      file = File.open(filename, "r:iso-8859-1")
      file.read.split("\r\n").each do |line|
        row = Row.parse(line)
        raise "Parse error while processing row:\n\t'#{line}'\n\tlen:#{line.length}" if row.nil?
        rows << row
      end
      RespDocument.new(rows)
    end


  end
end