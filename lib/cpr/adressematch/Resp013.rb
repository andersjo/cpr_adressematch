# coding: utf-8
module Cpr::Adressematch
class Resp013 < Cpr::Row
	title 'Personnummer oplysninger (013)'

	field 'Recordtype', 'N', 0..2, :default => '12'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Pnr', 'A', 27..36
	field 'Foeddto', 'N', 37..44
	field 'Koen', 'A', 45..45
	field 'Pnrgaeld', 'A', 46..55
end
end
