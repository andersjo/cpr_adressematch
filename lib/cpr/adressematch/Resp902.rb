# coding: utf-8
module Cpr::Adressematch
class Resp902 < Cpr::Row
	title 'Veje fra Adressematch (902)'

	field 'Recordtype', 'N', 0..2, :default => '902'
	field 'Sort-high-value', 'A', 3..7
	field 'Sort-proddto', 'N', 8..15
	field 'Sort-medtyp', 'A', 16..25
	field 'Indvnr', 'N', 26..29
	field 'Kundenr', 'N', 30..33
	field 'Kunderefnr', 'A', 34..48
	field 'Matchtyp', 'A', 49..49
	field 'Komkod', 'N', 50..53
	field 'Vejkod', 'N', 54..57
	field 'Postnr', 'N', 58..61
	field 'Postdisttxt', 'A', 62..81
	field 'Vejadrnvn', 'A', 82..101
	field 'Husnr', 'A', 102..105
	field 'Etage', 'A', 106..107
	field 'Sidedoer', 'A', 108..111
	field 'BNR', 'A', 112..115
	field 'Lokalitet', 'A', 116..149
	field 'Standardadr', 'A', 150..183
	field 'Bynvn', 'A', 184..217
end
end
