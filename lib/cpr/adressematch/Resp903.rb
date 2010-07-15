# coding: utf-8
module Cpr::Adressematch
class Resp903 < Cpr::Row
	title 'Optællinger fra Adressematch (903)'

	field 'Recordtype', 'N', 0..2, :default => '903'
	field 'Sort-high-value', 'A', 3..7
	field 'Sort-proddto', 'N', 8..15
	field 'Sort-medtyp', 'A', 16..25
	field 'Kundeliste', 'A', 26..130
end
end
