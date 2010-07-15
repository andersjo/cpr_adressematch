# coding: utf-8
module Cpr::Adressematch
class Resp012 < Cpr::Row
	title 'Personnummer abonnement (012)'

	field 'Recordtype', 'N', 0..2, :default => '12'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Pnr', 'A', 27..36
end
end
