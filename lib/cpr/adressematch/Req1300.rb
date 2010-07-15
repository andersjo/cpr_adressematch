# coding: utf-8
module Cpr::Adressematch
class Req1300 < Cpr::Row
	title 'Rekvisitioner og slettetransaktioner til abonnement (1300)'

	field 'Inddatatyp', 'A', 0..1, :default => '10'
	field 'Kundenr', 'N', 2..5
	field 'Kunderefnr', 'A', 6..20
	field 'Sortbyte', 'A', 21..21
	field 'Matchtyp', 'A', 22..22
	field 'Pnrsenrmrk', 'A', 23..23
end
end
