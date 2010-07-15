# coding: utf-8
module Cpr::Adressematch
class Resp001A < Cpr::Row
	title 'Aktuelle data for reklamebeskyttelsesudtræk (001A)'

	field 'Recordtype', 'N', 0..2, :default => '1'
	field 'Kunderefnr', 'A', 3..17
	field 'Rekmrk', 'N', 18..18
end
end
