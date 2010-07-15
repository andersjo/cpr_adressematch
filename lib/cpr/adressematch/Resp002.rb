# coding: utf-8
module Cpr::Adressematch
class Resp002 < Cpr::Row
	title 'Udlandsadresse (for udrejste personer) (002)'

	field 'Recordtype', 'N', 0..2, :default => '2'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Udlandadr1', 'A', 27..60
	field 'Udlandadr2', 'A', 61..94
	field 'Udlandadr3', 'A', 95..128
	field 'Udlandadr4', 'A', 129..162
	field 'Udlandadr5', 'A', 163..196
	field 'Udlandadrdto', 'N', 197..208
end
end
