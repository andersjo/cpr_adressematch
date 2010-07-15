# coding: utf-8
module Cpr::Adressematch
class Resp001 < Cpr::Row
	title 'Aktuelle data (001)'

	field 'Recordtype', 'N', 0..2, :default => '1'
	field 'Kunderefnr', 'A', 3..17
	field 'Proddto', 'N', 18..25
	field 'Pnrsenrmrk', 'A', 26..26
	field 'Matchtyp', 'A', 27..27
	field 'Statushaenstart', 'N', 28..39
	field 'Status', 'N', 40..41
	field 'Nvnadrbeskhaenstart', 'N', 42..53
	field 'Adrnvn', 'A', 54..87
	field 'Tilflydto', 'N', 88..99
	field 'Convn', 'A', 100..133
	field 'Lokalitet', 'A', 134..167
	field 'Standardadr', 'A', 168..201
	field 'Bynvn', 'A', 202..235
	field 'Postnr', 'N', 236..239
	field 'Postdisttxt', 'A', 240..259
	field 'Komkod', 'N', 260..263
	field 'Vejkod', 'N', 264..267
	field 'Husnr', 'A', 268..271
	field 'Etage', 'A', 272..273
	field 'Sidedoer', 'A', 274..277
	field 'BNR', 'A', 278..281
	field 'Formelnvn', 'A', 282..331
	field 'Efternvn', 'A', 332..371
	field 'Vejadrnvn', 'A', 372..391
	field 'Rekbeskhaenstart', 'N', 392..403
end
end
