# coding: utf-8
module Cpr::Adressematch
class Resp999 < Cpr::Row
	title 'Slutrecord (der dannes en pr. udtræk) (999)'

	field 'Recordtype', 'N', 0..2, :default => '999'
	field 'Sortfelt', 'A', 3..25
	field 'Taeller', 'N', 26..33
end
end
