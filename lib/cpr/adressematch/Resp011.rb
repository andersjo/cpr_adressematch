# coding: utf-8
module Cpr::Adressematch
class Resp011 < Cpr::Row
	title 'Andre kundereferencenumre (011)'

	field 'Recordtype', 'N', 0..2, :default => '11'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Kunderefnrandet-1', 'A', 27..41
	field 'Kunderefnrandet-2', 'A', 42..56
	field 'Kunderefnrandet-3', 'A', 57..71
	field 'Kunderefnrandet-4', 'A', 72..86
	field 'Kunderefnrandet-5', 'A', 87..101
end
end
