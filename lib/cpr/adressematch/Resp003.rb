# coding: utf-8
module Cpr::Adressematch
class Resp003 < Cpr::Row
	title 'Kontaktadresse (kontaktperson ved udrejse/forsvinding/død) (003)'

	field 'Recordtype', 'N', 0..2, :default => '3'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Kontaktadr1', 'A', 27..60
	field 'Kontaktadr2', 'A', 61..94
	field 'Kontaktadr3', 'A', 95..128
	field 'Kontaktadr4', 'A', 129..162
	field 'Kontaktadr5', 'A', 163..196
	field 'Kontaktadrdato', 'N', 197..208
end
end
