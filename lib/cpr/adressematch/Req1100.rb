# coding: utf-8
module Cpr::Adressematch
class Req1100 < Cpr::Row
	title 'Match tilgangs og engangstransaktion (1100)'

	field 'Inddatatyp', 'A', 0..1, :default => '10'
	field 'Kundenr', 'N', 2..5
	field 'Kunderefnr', 'A', 6..20
	field 'Sortbyte', 'A', 21..21, :default => '4'
	field 'Matchtyp', 'A', 22..22
	field 'Pnrsenrmrk', 'A', 23..23, :default => 'P'
	field 'Matchnvn', 'A', 24..73
	field 'Suplnvn', 'A', 74..123
	field 'Formelnvn', 'A', 124..173
	field 'Efternvn', 'A', 174..213
	field 'Komkod', 'N', 214..217
	field 'Postnr', 'N', 218..221
	field 'Vejkod', 'N', 222..225
	field 'Vejnvn', 'A', 226..265
	field 'Klaradr', 'A', 266..333
	field 'Husnummer', 'A', 334..336
	field 'Husbogstav', 'A', 337..337
	field 'Etage', 'A', 338..339
	field 'Sidedoer', 'A', 340..343
	field 'Bynvn', 'A', 344..377
	field 'Koen', 'A', 378..378
	field 'Foeddto', 'N', 379..386
end
end
