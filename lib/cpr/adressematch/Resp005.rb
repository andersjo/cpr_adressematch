# coding: utf-8
module Cpr::Adressematch
class Resp005 < Cpr::Row
	title 'Værgemål (005)'

	field 'Recordtype', 'N', 0..2, :default => '5'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Umynmyn haenstart', 'N', 27..38
	field 'Værgeadrnvn/adressat', 'A', 39..72
	field 'Værgeadressetxt-linie1', 'A', 73..106
	field 'Værgeadressetxt-linie2', 'A', 107..140
	field 'Værgeadressetxt-linie3', 'A', 141..174
	field 'Værgeadressetxt-linie4', 'A', 175..208
	field 'Værgeadressetxt-linie5', 'A', 209..242
end
end
