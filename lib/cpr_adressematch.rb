require 'cpr/kunderefnr'
require 'cpr/row'
require 'cpr/field'
require 'cpr/alphanumeric_field'
require 'cpr/numeric_field'
require 'cpr/resp_document'
require 'cpr/req_document'
Dir.glob("#{File.dirname(__FILE__)}/cpr/adressematch/*.rb").each do |file|
  require "cpr/adressematch/#{File.basename(file)}"
end