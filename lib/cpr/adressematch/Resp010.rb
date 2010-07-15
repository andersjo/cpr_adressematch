# coding: utf-8
module Cpr::Adressematch
class Resp010 < Cpr::Row
	title 'Kvittering for sletning (010)'

	field 'Recordtype', 'N', 0..2, :default => '10'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
end
end
