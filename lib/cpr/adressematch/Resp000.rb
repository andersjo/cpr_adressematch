# coding: utf-8
module Cpr::Adressematch
class Resp000 < Cpr::Row
	title 'Startrecord (000)'

	field 'Recordtype', 'N', 0..2, :default => '0'
	field 'Sortfelt', 'A', 3..25
	field 'Opgavenr', 'N', 26..31
	field 'Proddto', 'N', 32..39
	field 'Proddtoforrig', 'N', 40..47
end
end
