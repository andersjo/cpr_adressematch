# coding: utf-8
module Cpr::Adressematch
class Req1400 < Cpr::Row
	title 'Ændringstransaktioner til abonnement (1400)'

	field 'Inddatatyp', 'A', 0..1, :default => '10'
	field 'Kundenr', 'N', 2..5
	field 'Kunderefnr', 'A', 6..20
	field 'Sortbyte', 'A', 21..21, :default => '2'
	field 'Matchtyp', 'A', 22..22
	field 'Pnrsenrmrk', 'A', 23..23
	field 'Kunderefnrgl', 'A', 24..38
end
end
