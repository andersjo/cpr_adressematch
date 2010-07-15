# coding: utf-8
module Cpr::Adressematch
class Resp004 < Cpr::Row
	title 'Civilstand (004)'

	field 'Recordtype', 'N', 0..2, :default => '4'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Civst', 'A', 27..27
	field 'Haenstart-ctciv', 'N', 28..39
end
end
