# coding: utf-8
module Cpr::Adressematch
class Resp901 < Cpr::Row
	title 'Fejlmeddelelser fra Adressematch (901)'

	field 'Recordtype', 'N', 0..2, :default => '901'
	field 'Sort-high-value', 'A', 3..7
	field 'Sort-proddto', 'N', 8..15
	field 'Sort-medtyp', 'A', 16..25
	field 'Indvnr', 'N', 26..29
	field 'Kundenr', 'N', 30..33
	field 'Kunderefnr', 'A', 34..48
	field 'Matchtyp', 'A', 49..49
	field 'Fejlnr', 'N', 50..53
	field 'Fejlfelt', 'A', 54..105
end
end
