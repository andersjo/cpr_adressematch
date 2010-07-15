# coding: utf-8
module Cpr::Adressematch
class Req1200 < Cpr::Row
	title 'Vejtransaktion (1200)'

	field 'Inddatatyp', 'A', 0..1, :default => '10'
	field 'Kundenr', 'N', 2..5
	field 'Kunderefnr', 'A', 6..20
	field 'Sortbyte', 'A', 21..21, :default => '4'
	field 'Matchtyp', 'A', 22..22
	field 'Postnr', 'N', 23..26
	field 'Vejnvn', 'A', 27..66
	field 'Klaradr', 'A', 67..134
	field 'Husnummer', 'A', 135..137
	field 'Husbogstav', 'A', 138..138
	field 'Etage', 'A', 139..140
	field 'Sidedoer', 'A', 141..144
	field 'Bynvn', 'A', 145..178
end
end
