# coding: utf-8
module Cpr::Adressematch
class Resp998 < Cpr::Row
	title 'Nøgletal fra Adressematchen (998)'

	field 'Recordtype', 'N', 0..2, :default => '998'
	field 'Nøgletal1', 'N', 3..12
	field 'Nøgletal2', 'N', 13..22
	field 'Nøgletal3', 'N', 23..32
	field 'Nøgletal4', 'N', 33..42
	field 'Nøgletal5', 'N', 43..52
	field 'Nøgletal6', 'N', 53..62
	field 'Nøgletal7', 'N', 63..72
	field 'Nøgletal8', 'N', 73..82
end
end
