# coding: utf-8
module Cpr::Adressematch
class Resp910 < Cpr::Row
	title 'Fejlmeddelelser vedr. PNR-abonnementer (910)'

	field 'Recordtype', 'N', 0..2, :default => '910'
	field 'Sortfelt-10', 'A', 3..12
	field 'Inddata', 'A', 13..87
	field 'Fejlnr', 'N', 88..91
	field 'Fejltxt-udtræk', 'A', 92..156
end
end
