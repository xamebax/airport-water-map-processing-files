require "csv"
require "json"
require "geocoder"

airports_array = CSV.read("european-airports_raw", { :col_sep => "\t" })

@located_airports_flat = []

# airports_array.each do |airport|
#   p "Locating #{airport}..."
#   @located_airports_flat << Geocoder.search("#{airport[0]} #{airport[1]}")[0].data["geometry"], ["location"]
# end

@located_airports_flat = [["Tirana Airport ", "Albania ", "TIA ", "LATI", {"lat"=>41.41444509999999, "lng"=>19.7192999}], ["Yerevan Zvartnots Airport ", "Armenia ", "EVN ", "UDYZ", {"lat"=>40.1491782, "lng"=>44.3988571}], ["Graz Airport ", "Austria ", "GRZ ", "LOWG", {"lat"=>46.9940455, "lng"=>15.4401314}], ["Innsbruck Airport ", "Austria ", "INN ", "LOWI", {"lat"=>47.2576489, "lng"=>11.3513075}], ["Klagenfurt Airport ", "Austria ", "KLU ", "LOWK", {"lat"=>46.6500125, "lng"=>14.3248578}], ["Linz Airport ", "Austria ", "LNZ ", "LOWL", {"lat"=>48.2398041, "lng"=>14.1923272}], ["Salzburg Airport ", "Austria ", "SZG ", "LOWS", {"lat"=>47.7926466, "lng"=>13.0029274}], ["Vienna Airport ", "Austria ", "VIE ", "LOWW", {"lat"=>48.1158333, "lng"=>16.5665751}], ["Baku Airport ", "Azerbaijan ", "GYD ", "UBBB", {"lat"=>40.4650264, "lng"=>50.0522984}], ["Minsk Airport ", "Belarus ", "MSQ ", "UMMS", {"lat"=>53.8880522, "lng"=>28.0343414}], ["Antwerp Airport ", "Belgium ", "ANR ", "EBAW", {"lat"=>51.18874599999999, "lng"=>4.4608734}], ["Brussels Airport ", "Belgium ", "BRU ", "EBBR", {"lat"=>50.900999, "lng"=>4.4855744}], ["Charleroi Airport ", "Belgium ", "CRL ", "EBCI", {"lat"=>50.4642198, "lng"=>4.4649753}], ["Liege Airport ", "Belgium ", "LGG ", "EBLG", {"lat"=>50.6411593, "lng"=>5.447911599999999}], ["Ostend Bruges Airport ", "Belgium ", "OST ", "EBOS", {"lat"=>51.2041938, "lng"=>2.8698128}], ["Sarajevo Airport ", "Bosnia and Herzegovina ", "SJJ ", "LQSA", {"lat"=>43.824731, "lng"=>18.3313595}], ["Tuzla Airport ", "Bosnia and Herzegovina ", "TZL ", "LQTZ", {"lat"=>44.4586468, "lng"=>18.7248264}], ["Burgas Airport ", "Bulgaria ", "BOJ ", "LBBG", {"lat"=>42.5652706, "lng"=>27.5160873}], ["Sofia Airport ", "Bulgaria ", "SOF ", "LBSF", {"lat"=>42.6893691, "lng"=>23.4144249}], ["Varna Airport ", "Bulgaria ", "VAR ", "LBWN", {"lat"=>42.5652706, "lng"=>27.5160873}], ["Dubrovnik Airport ", "Croatia ", "DBV ", "LDDU", {"lat"=>42.5611109, "lng"=>18.268056}], ["Pula Airport ", "Croatia ", "PUY ", "LDPL", {"lat"=>44.8946096, "lng"=>13.9234263}], ["Split Airport ", "Croatia ", "SPU ", "LDSP", {"lat"=>43.538626, "lng"=>16.2983962}], ["Zadar Airport ", "Croatia ", "ZAD ", "LDZD", {"lat"=>44.1054683, "lng"=>15.3486661}], ["Zagreb Airport ", "Croatia ", "ZAG ", "LDZA", {"lat"=>45.7407504, "lng"=>16.0674365}], ["Larnaca Airport ", "Cyprus ", "LCA ", "LCLK", {"lat"=>34.8723402, "lng"=>33.6203516}], ["Paphos Airport ", "Cyprus ", "PFO ", "LCPH", {"lat"=>34.7135493, "lng"=>32.4828119}], ["Brno Airport ", "Czech Republic ", "BRQ ", "LKTB", {"lat"=>49.1522313, "lng"=>16.6933509}], ["Prague Airport ", "Czech Republic ", "PRG ", "LKPR", {"lat"=>50.10179100000001, "lng"=>14.2631811}], ["Aalborg Airport ", "Denmark ", "AAL ", "EKYT", {"lat"=>57.0969187, "lng"=>9.8564632}], ["Aarhus Airport ", "Denmark ", "AAR ", "EKAH", {"lat"=>56.3075123, "lng"=>10.6281027}], ["Billund Airport ", "Denmark ", "BLL ", "EKBI", {"lat"=>55.7408067, "lng"=>9.1525999}], ["Copenhagen Airport ", "Denmark ", "CPH ", "EKCH", {"lat"=>55.6180236, "lng"=>12.6507628}], ["Tallinn Airport ", "Estonia ", "TLL ", "EETN", {"lat"=>59.41635609999999, "lng"=>24.7996584}], ["Helsinki Vantaa Airport ", "Finland ", "HEL ", "EFHK", {"lat"=>60.32104159999999, "lng"=>24.9528604}], ["Oulu Airport ", "Finland ", "OUL ", "EFOU", {"lat"=>64.9308748, "lng"=>25.3558378}], ["Rovaniemi Airport ", "Finland ", "RVN ", "EFRO", {"lat"=>66.563104, "lng"=>25.8300783}], ["Tampere Airport ", "Finland ", "TMP ", "EFTP", {"lat"=>61.41485689999999, "lng"=>23.6046296}], ["Turku Airport ", "Finland ", "TKU ", "EFTU", {"lat"=>60.5114979, "lng"=>22.2632854}], ["Vaasa Airport ", "Finland ", "VAA ", "EFVA", {"lat"=>63.0512476, "lng"=>21.762713}], ["Ajaccio Airport ", "France ", "AJA ", "LFKJ", {"lat"=>41.9197777, "lng"=>8.7942675}], ["Basel Mulhouse Freiburg Airport ", "France ", "BSL, MLH, EAP ", "LFSB", {"lat"=>47.5981804, "lng"=>7.525495799999999}], ["Bastia Airport ", "France ", "BIA ", "LFKB", {"lat"=>42.5524176, "lng"=>9.482549800000001}], ["Bergerac Airport ", "France ", "EGC ", "LFBE", {"lat"=>44.8222713, "lng"=>0.5140427}], ["Biarritz Airport ", "France ", "BIQ ", "LFBZ", {"lat"=>43.4691931, "lng"=>-1.5302868}], ["Bordeaux Airport ", "France ", "BOD ", "LFBD", {"lat"=>44.8305935, "lng"=>-0.7103052}], ["Brest Bretagne Airport ", "France ", "BES ", "LFRB", {"lat"=>48.4476378, "lng"=>-4.417832400000001}], ["Figari South Corsica Airport ", "France ", "FSC ", "LFKF", {"lat"=>41.5023348, "lng"=>9.098381}], ["Lille Airport ", "France ", "LIL ", "LFQQ", {"lat"=>50.5669925, "lng"=>3.1037308}], ["Lyon-Saint Exupéry Airport ", "France ", "LYS ", "LFLL", {"lat"=>45.7234181, "lng"=>5.0887768}], ["Marseille Airport ", "France ", "MRS ", "LFML", {"lat"=>43.4384235, "lng"=>5.214414}], ["Montpellier Airport ", "France ", "MPL ", "LFMT", {"lat"=>43.5810301, "lng"=>3.9626654}], ["Nantes Airport ", "France ", "NTE ", "LFRS", {"lat"=>47.15741879999999, "lng"=>-1.6062316}], ["Nice Airport ", "France ", "NCE ", "LFMN", {"lat"=>43.6597689, "lng"=>7.214821400000001}], ["Paris Beauvais Airport ", "France ", "BVA ", "LFOB", {"lat"=>49.4544677, "lng"=>2.1115111}], ["Paris Charles de Gaulle Airport ", "France ", "CDG ", "LFPG", {"lat"=>49.0096906, "lng"=>2.5479245}], ["Paris Orly Airport ", "France ", "ORY ", "LFPO", {"lat"=>48.7262433, "lng"=>2.3652472}], ["Strasbourg Airport ", "France ", "SXB ", "LFST", {"lat"=>48.5447277, "lng"=>7.6281328}], ["Toulon-Hyères Airport ", "France ", "TLN ", "LFTH", {"lat"=>43.0910306, "lng"=>6.1592297}], ["Toulouse Blagnac Airport ", "France ", "TLS ", "LFBO", {"lat"=>43.6293863, "lng"=>1.367682}], ["Tbilisi Airport ", "Georgia ", "TBS ", "UGTB", {"lat"=>41.6695682, "lng"=>44.9646172}], ["Allgäu Airport Memmingen ", "Germany ", "FMM ", "EDJA", {"lat"=>47.98792, "lng"=>10.2325154}], ["Berlin Brandenburg Airport ", "Germany ", "BER ", "EDDB", {"lat"=>52.38544109999999, "lng"=>13.5216148}], ["Berlin Schönefeld Airport ", "Germany ", "SXF ", "EDDB", {"lat"=>52.38544109999999, "lng"=>13.5216148}], ["Berlin Tegel Airport ", "Germany ", "TXL ", "EDDT", {"lat"=>52.5588327, "lng"=>13.2884374}], ["Bremen Airport ", "Germany ", "BRE ", "EDDW", {"lat"=>53.0479741, "lng"=>8.7858793}], ["Cologne Bonn Airport ", "Germany ", "CGN ", "EDDK", {"lat"=>50.8707168, "lng"=>7.140734399999999}], ["Dortmund Airport ", "Germany ", "DTM ", "EDLW", {"lat"=>51.517319, "lng"=>7.6120193}], ["Dresden Airport ", "Germany ", "DRS ", "EDDC", {"lat"=>51.1321529, "lng"=>13.7672072}], ["Düsseldorf Airport ", "Germany ", "DUS ", "EDDL", {"lat"=>51.2876146, "lng"=>6.7667912}], ["Frankfurt Airport ", "Germany ", "FRA ", "EDDF", {"lat"=>50.0379326, "lng"=>8.562151799999999}], ["Friedrichshafen Airport ", "Germany ", "FDH ", "EDNY", {"lat"=>47.6722451, "lng"=>9.5121906}], ["Hahn Airport ", "Germany ", "HHN ", "EDFH", {"lat"=>49.9458052, "lng"=>7.2641958}], ["Hamburg Airport ", "Germany ", "HAM ", "EDDH", {"lat"=>53.633622, "lng"=>9.9974128}], ["Hannover Airport ", "Germany ", "HAJ ", "EDDV", {"lat"=>52.4618486, "lng"=>9.6889919}], ["Karlsruhe Baden-Baden Airport ", "Germany ", "FKB ", "EDSB", {"lat"=>48.7783557, "lng"=>8.0909751}], ["Leipzig Halle Airport ", "Germany ", "LEJ ", "EDDP", {"lat"=>51.4220814, "lng"=>12.2203805}], ["München Airport ", "Germany ", "MUC ", "EDDM", {"lat"=>48.3536621, "lng"=>11.7750279}], ["Münster Osnabrück Airport ", "Germany ", "FMO ", "EDDG", {"lat"=>52.1338912, "lng"=>7.6852386}], ["Nürnberg Airport ", "Germany ", "NUE ", "EDDN", {"lat"=>49.4971202, "lng"=>11.079808}], ["Paderborn Lippstadt Airport ", "Germany ", "PAD ", "EDLP", {"lat"=>51.6107798, "lng"=>8.6198113}], ["Stuttgart Airport ", "Germany ", "STR ", "EDDS", {"lat"=>48.6876365, "lng"=>9.205575999999999}], ["Weeze Airport ", "Germany ", "NRN ", "EDLV", {"lat"=>51.5995781, "lng"=>6.1503945}], ["Athens Airport ", "Greece ", "ATH ", "LGAV", {"lat"=>37.9356467, "lng"=>23.9484156}], ["Chania Airport ", "Greece ", "CHQ ", "LGSA", {"lat"=>35.5398503, "lng"=>24.1403444}], ["Corfu Airport ", "Greece ", "CFU ", "LGKR", {"lat"=>39.6076445, "lng"=>19.9144861}], ["Heraklion Airport ", "Greece ", "HER ", "LGIR", {"lat"=>35.3395798, "lng"=>25.1747483}], ["Kos Airport ", "Greece ", "KGS ", "LGKO", {"lat"=>36.8003475, "lng"=>27.087821}], ["Rhodos Airport ", "Greece ", "RHO ", "LGRP", {"lat"=>36.402288, "lng"=>28.09022}], ["Thessaloniki Airport ", "Greece ", "SKG ", "LGTS", {"lat"=>40.5204227, "lng"=>22.9716758}], ["Budapest Airport ", "Hungary ", "BUD ", "LHBP", {"lat"=>47.4384587, "lng"=>19.2522958}], ["Debrecen Airport ", "Hungary ", "DEB ", "LHDC", {"lat"=>47.4897469, "lng"=>21.61219}], ["Keflavik Airport ", "Iceland ", "KEF ", "BIKF", {"lat"=>63.98680669999999, "lng"=>-22.6279668}], ["Cork Airport ", "Ireland ", "ORK ", "EICK", {"lat"=>51.8449269, "lng"=>-8.4927917}], ["Dublin Airport ", "Ireland ", "DUB ", "EIDW", {"lat"=>53.42644809999999, "lng"=>-6.249909799999999}], ["Ireland West Airport Knock ", "Ireland ", "NOC ", "EIKN", {"lat"=>53.9138057, "lng"=>-8.811219200000002}], ["Kerry Airport ", "Ireland ", "KIR ", "EIKY", {"lat"=>52.181386, "lng"=>-9.537219}], ["Shannon Airport ", "Ireland ", "SNN ", "EINN", {"lat"=>52.6996573, "lng"=>-8.914691099999999}], ["Alghero Airport ", "Italy ", "AHO ", "LIEA", {"lat"=>40.6332779, "lng"=>8.2896846}], ["Ancona Airport ", "Italy ", "AOI ", "LIPY", {"lat"=>43.6156124, "lng"=>13.362015}], ["Bari Airport ", "Italy ", "BRI ", "LIBD", {"lat"=>41.137508, "lng"=>16.765202}], ["Bergamo Airport ", "Italy ", "BGY ", "LIME", {"lat"=>45.66957070000001, "lng"=>9.7036313}], ["Bologna Airport ", "Italy ", "BLQ ", "LIPE", {"lat"=>44.5345216, "lng"=>11.2878593}], ["Brindisi Airport ", "Italy ", "BDS ", "LIBR", {"lat"=>40.6567625, "lng"=>17.9453492}], ["Cagliari Airport ", "Italy ", "CAG ", "LIEE", {"lat"=>39.2515388, "lng"=>9.0556723}], ["Catania Fontanarossa Airport ", "Italy ", "CTA ", "LICC", {"lat"=>37.4673046, "lng"=>15.0657746}], ["Comiso Airport ", "Italy ", "CIY ", "LICB", {"lat"=>36.9960723, "lng"=>14.6080104}], ["Florence Airport ", "Italy ", "FLR ", "LIRQ", {"lat"=>43.8086534, "lng"=>11.2012247}], ["Genoa Airport ", "Italy ", "GOA ", "LIMJ", {"lat"=>44.4122974, "lng"=>8.8461075}], ["Lamezia Terme Airport ", "Italy ", "SUF ", "LICA", {"lat"=>38.9065845, "lng"=>16.2434017}], ["Milan Linate Airport ", "Italy ", "LIN ", "LIML", {"lat"=>45.452176, "lng"=>9.276308}], ["Milan Malpensa Airport ", "Italy ", "MXP ", "LIMC", {"lat"=>45.6300625, "lng"=>8.7255307}], ["Naples Airport ", "Italy ", "NAP ", "LIRN", {"lat"=>40.8829943, "lng"=>14.2865792}], ["Olbia Costa Smeralda Airport ", "Italy ", "OLB ", "LIEO", {"lat"=>40.9003714, "lng"=>9.5180495}], ["Palermo Airport ", "Italy ", "PMO ", "LICJ", {"lat"=>38.1824001, "lng"=>13.1005819}], ["Perugia Airport ", "Italy ", "PEG ", "LIRZ", {"lat"=>43.0968391, "lng"=>12.5115538}], ["Pescara Airport ", "Italy ", "PSR ", "LIBP", {"lat"=>42.4318438, "lng"=>14.1829232}], ["Pisa Airport ", "Italy ", "PSA ", "LIRP", {"lat"=>43.6890842, "lng"=>10.3978845}], ["Rome Ciampino Airport ", "Italy ", "CIA ", "LIRA", {"lat"=>41.7995234, "lng"=>12.5907988}], ["Rome Fiumicino Airport ", "Italy ", "FCO ", "LIRF", {"lat"=>41.7998868, "lng"=>12.2462384}], ["Trapani Airport ", "Italy ", "TPS ", "LICT", {"lat"=>37.901504, "lng"=>12.496009}], ["Treviso Airport ", "Italy ", "TSF ", "LIPH", {"lat"=>45.6532764, "lng"=>12.2020813}], ["Turin Airport ", "Italy ", "TRN ", "LIMF", {"lat"=>45.1965359, "lng"=>7.647867000000001}], ["Venice Airport ", "Italy ", "VCE ", "LIPZ", {"lat"=>45.5028312, "lng"=>12.3478246}], ["Verona Airport ", "Italy ", "VRN ", "LIPX", {"lat"=>45.4000011, "lng"=>10.8901406}], ["Almaty Airport ", "Kazakhstan ", "ALA ", "UAAA", {"lat"=>43.3499265, "lng"=>77.02528939999999}], ["Astana Airport ", "Kazakhstan ", "TSE ", "UACC", {"lat"=>51.02704019999999, "lng"=>71.4608109}], ["Riga Airport ", "Latvia ", "RIX ", "EVRA", {"lat"=>56.9226554, "lng"=>23.9733129}], ["Kaunas Airport ", "Lithuania ", "KUN ", "EYKA", {"lat"=>54.9670001, "lng"=>24.0735752}], ["Vilnius Airport ", "Lithuania ", "VNO ", "EYVI", {"lat"=>54.6380366, "lng"=>25.2865583}], ["Luxembourg Airport ", "Luxembourg ", "LUX ", "ELLX", {"lat"=>49.6289002, "lng"=>6.2147446}], ["Skopje Airport ", "Macedonia ", "SKP ", "LWSK", {"lat"=>41.963161, "lng"=>21.6223532}], ["Malta Airport ", "Malta ", "MLA ", "LMML", {"lat"=>35.8541135, "lng"=>14.4832795}], ["Chisinau Airport ", "Moldova ", "KIV ", "LUKK", {"lat"=>46.93517, "lng"=>28.935167}], ["Podgorica Airport ", "Montenegro ", "TGD ", "LYPG", {"lat"=>42.3603394, "lng"=>19.2507601}], ["Tivat Airport ", "Montenegro ", "TIV ", "LYTV", {"lat"=>42.404444, "lng"=>18.723056}], ["Amsterdam Airport Schiphol ", "Netherlands ", "AMS ", "EHAM", {"lat"=>52.3105386, "lng"=>4.7682744}], ["Eindhoven Airport ", "Netherlands ", "EIN ", "EHEH", {"lat"=>51.4583691, "lng"=>5.3920556}], ["Groningen Airport Eelde ", "Netherlands ", "GRQ ", "EHGG", {"lat"=>53.128384, "lng"=>6.585679}], ["Maastricht Aachen Airport ", "Netherlands ", "MST ", "EHBK", {"lat"=>50.9123207, "lng"=>5.769495099999999}], ["Rotterdam The Hague Airport ", "Netherlands ", "RTM ", "EHRD", {"lat"=>51.95550859999999, "lng"=>4.4398832}], ["Ålesund Airport ", "Norway ", "AES ", "ENAL", {"lat"=>62.5593728, "lng"=>6.111490799999999}], ["Bergen Airport ", "Norway ", "BGO ", "ENBR", {"lat"=>60.29183, "lng"=>5.2220173}], ["Bodø Airport ", "Norway ", "BOO ", "ENBO", {"lat"=>67.26830989999999, "lng"=>14.3622371}], ["Haugesund Airport ", "Norway ", "HAU ", "ENHD", {"lat"=>59.34363930000001, "lng"=>5.212986799999999}], ["Kristiansand Airport ", "Norway ", "KRS ", "ENCN", {"lat"=>58.20383030000001, "lng"=>8.0837693}], ["Moss Airport Rygge ", "Norway ", "RYG ", "ENRY", {"lat"=>59.3783741, "lng"=>10.784197}], ["Oslo Airport Gardermoen ", "Norway ", "OSL ", "ENGM", {"lat"=>60.1975501, "lng"=>11.1004153}], ["Sandefjord Airport Torp ", "Norway ", "TRF ", "ENTO", {"lat"=>59.1824458, "lng"=>10.2569121}], ["Stavanger Airport ", "Norway ", "SVG ", "ENZV", {"lat"=>58.88044069999999, "lng"=>5.6314022}], ["Tromsø Airport ", "Norway ", "TOS ", "ENTC", {"lat"=>69.6819354, "lng"=>18.9162637}], ["Trondheim Airport ", "Norway ", "TRD ", "ENVA", {"lat"=>63.45826979999999, "lng"=>10.922599}], ["Gdansk Airport ", "Poland ", "GDN ", "EPGD", {"lat"=>54.3788433, "lng"=>18.468075}], ["Katowice Airport ", "Poland ", "KTW ", "EPKT", {"lat"=>50.4728015, "lng"=>19.0758814}], ["Kraków Airport ", "Poland ", "KRK ", "EPKK", {"lat"=>50.0769776, "lng"=>19.7881188}], ["Modlin Airport ", "Poland ", "WMI ", "EPMO", {"lat"=>52.4492645, "lng"=>20.6512374}], ["Poznan Airport ", "Poland ", "POZ ", "EPPO", {"lat"=>52.4199508, "lng"=>16.8286158}], ["Warsaw Airport ", "Poland ", "WAW ", "EPWA", {"lat"=>52.1672369, "lng"=>20.9678911}], ["Wroclaw Airport ", "Poland ", "WRO ", "EPWR", {"lat"=>51.1041654, "lng"=>16.8809331}], ["Faro Airport ", "Portugal ", "FAO ", "LPFR", {"lat"=>37.0175956, "lng"=>-7.96972}], ["Lisbon Airport ", "Portugal ", "LIS ", "LPPT", {"lat"=>38.7755936, "lng"=>-9.135366699999999}], ["Madeira Airport ", "Portugal ", "FNC ", "LPMA", {"lat"=>32.6957983, "lng"=>-16.775873699999998}], ["Ponta Delgada Airport ", "Portugal ", "PDL ", "LPPD", {"lat"=>37.74233, "lng"=>-25.7003889}], ["Porto Airport ", "Portugal ", "OPO ", "LPPR", {"lat"=>41.2421186, "lng"=>-8.6785514}], ["Bucharest Henri Coanda Airport ", "Romania ", "OTP ", "LROP", {"lat"=>44.5707306, "lng"=>26.0844123}], ["Cluj-Napoca Airport ", "Romania ", "CLJ ", "LRCL", {"lat"=>46.7846851, "lng"=>23.6889981}], ["Timisoara Airport ", "Romania ", "TSR ", "LRTR", {"lat"=>45.8102336, "lng"=>21.320193}], ["Koltsovo Airport ", "Russia ", "SVX ", "USSS", {"lat"=>56.7447746, "lng"=>60.8029485}], ["Moscow Domodedovo Airport ", "Russia ", "DME ", "UUDD", {"lat"=>55.41030689999999, "lng"=>37.9024513}], ["Moscow Sheremetyevo Airport ", "Russia ", "SVO ", "UUEE", {"lat"=>55.9736482, "lng"=>37.4125029}], ["Moscow Vnukovo Airport ", "Russia ", "VKO ", "UUWW", {"lat"=>55.59964799999999, "lng"=>37.27123419999999}], ["Saint Petersburg Pulkovo Airport ", "Russia ", "LED ", "ULLI", {"lat"=>59.80291270000001, "lng"=>30.2678391}], ["Sochi Airport ", "Russia ", "AER ", "URSS", {"lat"=>43.4487326, "lng"=>39.9420245}], ["Belgrade Nikola Tesla Airport ", "Serbia ", "BEG ", "LYBE", {"lat"=>44.820498, "lng"=>20.291691}], ["Pristina Airport ", "Serbia ", "PRN ", "BKPR", {"lat"=>42.5735366, "lng"=>21.0346155}], ["Bratislava Airport ", "Slovakia ", "BTS ", "LZIB", {"lat"=>48.1702634, "lng"=>17.2105238}], ["Ljubljana Airport ", "Slovenia ", "LJU ", "LJLJ", {"lat"=>46.2259433, "lng"=>14.4559143}], ["Alicante Airport ", "Spain ", "ALC ", "LEAL", {"lat"=>38.285483, "lng"=>-0.560056}], ["Almeria Airport ", "Spain ", "LEI ", "LEAM", {"lat"=>36.8449541, "lng"=>-2.3707736}], ["Barcelona Airport ", "Spain ", "BCN ", "LEBL", {"lat"=>41.297445, "lng"=>2.0832941}], ["Bilbao Airport ", "Spain ", "BIO ", "LEBB", {"lat"=>43.302494, "lng"=>-2.911116}], ["Fuerteventura Airport ", "Spain ", "FUE ", "GCFV", {"lat"=>28.4526212, "lng"=>-13.8694245}], ["Girona Airport ", "Spain ", "GRO ", "LEGE", {"lat"=>41.8975373, "lng"=>2.7662477}], ["Gran Canaria Airport ", "Spain ", "LPA ", "GCLP", {"lat"=>27.9331848, "lng"=>-15.3877066}], ["Ibiza Airport ", "Spain ", "IBZ ", "LEIB", {"lat"=>38.8748594, "lng"=>1.3712232}], ["Jerez Airport ", "Spain ", "XRY ", "LEJR", {"lat"=>36.7452935, "lng"=>-6.0608778}], ["Lanzarote Airport ", "Spain ", "ACE ", "GCRR", {"lat"=>28.950438, "lng"=>-13.6057769}], ["Madrid Barajas Airport ", "Spain ", "MAD ", "LEMD", {"lat"=>40.4839361, "lng"=>-3.5679515}], ["Malaga Airport ", "Spain ", "AGP ", "LEMG", {"lat"=>36.6794172, "lng"=>-4.4950028}], ["Mallorca Airport ", "Spain ", "PMI ", "LEPA", {"lat"=>39.5517407, "lng"=>2.7361649}], ["Menorca Airport ", "Spain ", "MAH ", "LEMH", {"lat"=>39.8646069, "lng"=>4.2256691}], ["Murcia-San Javier Airport ", "Spain ", "MJV ", "LELC", {"lat"=>37.7753269, "lng"=>-0.8181273}], ["Reus Airport ", "Spain ", "REU ", "LERS", {"lat"=>41.1469852, "lng"=>1.1537147}], ["Santander Airport ", "Spain ", "SDR ", "LEXJ", {"lat"=>43.423292000000004, "lng"=>-3.8242487}], ["Santiago de Compostela Airport ", "Spain ", "SCQ ", "LEST", {"lat"=>42.8952527, "lng"=>-8.4221142}], ["Seville Airport ", "Spain ", "SVQ ", "LEZL", {"lat"=>37.4201674, "lng"=>-5.89305}], ["Tenerife North Airport ", "Spain ", "TFN ", "GCXO", {"lat"=>28.484511, "lng"=>-16.3434204}], ["Tenerife South Airport ", "Spain ", "TFS ", "GCTS", {"lat"=>28.0457718, "lng"=>-16.576216}], ["Valencia Airport ", "Spain ", "VLC ", "LEVC", {"lat"=>39.4892327, "lng"=>-0.4780256}], ["Zaragoza Airport ", "Spain ", "ZAZ ", "LEZG", {"lat"=>41.663511, "lng"=>-1.0079225}], ["Gothenburg Landvetter Airport ", "Sweden ", "GOT ", "ESGG", {"lat"=>57.668799, "lng"=>12.292314}], ["Malmö Airport ", "Sweden ", "MMX ", "ESMS", {"lat"=>55.5355336, "lng"=>13.3723829}], ["Stockholm Arlanda Airport ", "Sweden ", "ARN ", "ESSA", {"lat"=>59.6497622, "lng"=>17.9237807}], ["Stockholm Bromma Airport ", "Sweden ", "BMA ", "ESSB", {"lat"=>59.354812, "lng"=>17.9427216}], ["Stockholm Skavsta Airport ", "Sweden ", "NYO ", "ESKN", {"lat"=>58.78902009999999, "lng"=>16.9153649}], ["Stockholm Västerås Airport ", "Sweden ", "VST ", "ESOW", {"lat"=>59.59266049999999, "lng"=>16.6321569}], ["Bern Airport ", "Switzerland ", "BRN ", "LSZB", {"lat"=>46.912222, "lng"=>7.499167000000001}], ["Genève Airport ", "Switzerland ", "GVA ", "LSGG", {"lat"=>46.23700969999999, "lng"=>6.1091564}], ["Lugano Airport ", "Switzerland ", "LUG ", "LSZA", {"lat"=>46.0044161, "lng"=>8.910109499999999}], ["Zürich Airport ", "Switzerland ", "ZRH ", "LSZH", {"lat"=>47.4582165, "lng"=>8.5554755}], ["Adana Airport ", "Turkey ", "ADA ", "LTAF", {"lat"=>36.98516600000001, "lng"=>35.2970875}], ["Ankara Esenboga Airport ", "Turkey ", "ESB ", "LTAC", {"lat"=>40.1244399, "lng"=>32.9916726}], ["Antalya Airport ", "Turkey ", "AYT ", "LTAI", {"lat"=>36.9043327, "lng"=>30.8018768}], ["Dalaman Airport ", "Turkey ", "DLM ", "LTBS", {"lat"=>36.7181305, "lng"=>28.7933172}], ["Istanbul Atatürk Airport ", "Turkey ", "IST ", "LTBA", {"lat"=>40.9829888, "lng"=>28.8104425}], ["Istanbul Sabiha Gökcen Airport ", "Turkey ", "SAW ", "LTFJ", {"lat"=>40.905371, "lng"=>29.3168603}], ["Izmir Adnan Menderes Airport ", "Turkey ", "ADB ", "LTBJ", {"lat"=>38.293763, "lng"=>27.1520285}], ["Milas-Bodrum Airport ", "Turkey ", "BJV ", "LTFE", {"lat"=>37.248656, "lng"=>27.6639925}], ["Trabzon Airport ", "Turkey ", "TZX ", "LTCG", {"lat"=>40.9941091, "lng"=>39.7822187}], ["Kiev Borispol Airport ", "Ukraine ", "KBP ", "UKBB", {"lat"=>50.33822199999999, "lng"=>30.8939274}], ["Kiev Zhuliany Airport ", "Ukraine ", "IEV ", "UKKK", {"lat"=>50.4119842, "lng"=>30.4432539}], ["Odessa Airport ", "Ukraine ", "ODS ", "UKOO", {"lat"=>46.4298271, "lng"=>30.6774409}], ["Aberdeen Airport ", "United Kingdom ", "ABZ ", "EGPD", {"lat"=>57.20369789999999, "lng"=>-2.2001618}], ["Belfast City Airport ", "United Kingdom ", "BHD ", "EGAC", {"lat"=>54.6176164, "lng"=>-5.871830399999999}], ["Belfast International Airport ", "United Kingdom ", "BFS ", "EGAA", {"lat"=>54.661781, "lng"=>-6.2162444}], ["Birmingham Airport ", "United Kingdom ", "BHX ", "EGBB", {"lat"=>52.45238209999999, "lng"=>-1.7435071}], ["Bristol Airport ", "United Kingdom ", "BRS ", "EGGD", {"lat"=>51.38363039999999, "lng"=>-2.7135463}], ["Cardiff Airport ", "United Kingdom ", "CWL ", "EGFF", {"lat"=>51.3985498, "lng"=>-3.3394574}], ["East Midlands Airport ", "United Kingdom ", "EMA ", "EGNX", {"lat"=>52.82937399999999, "lng"=>-1.332134}], ["Edinburgh Airport ", "United Kingdom ", "EDI ", "EGPH", {"lat"=>55.950785, "lng"=>-3.3614532}], ["Glasgow Airport ", "United Kingdom ", "GLA ", "EGPF", {"lat"=>55.8690744, "lng"=>-4.4350529}], ["Glasgow Prestwick Airport ", "United Kingdom ", "PIK ", "EGPK", {"lat"=>55.5089021, "lng"=>-4.6109806}], ["Humberside Airport ", "United Kingdom ", "HUY ", "EGNJ", {"lat"=>53.5803147, "lng"=>-0.3490059}], ["Jersey Airport ", "United Kingdom ", "JER ", "EGJJ", {"lat"=>49.2074637, "lng"=>-2.1952207}], ["Leeds Bradford Airport ", "United Kingdom ", "LBA ", "EGNM", {"lat"=>53.86794339999999, "lng"=>-1.6615306}], ["Liverpool Airport ", "United Kingdom ", "LPL ", "EGGP", {"lat"=>53.3375129, "lng"=>-2.8544274}], ["London City Airport ", "United Kingdom ", "LCY ", "EGLC", {"lat"=>51.5048437, "lng"=>0.049518}], ["London Gatwick Airport ", "United Kingdom ", "LGW ", "EGKK", {"lat"=>51.1536621, "lng"=>-0.1820629}], ["London Heathrow Airport ", "United Kingdom ", "LHR ", "EGLL", {"lat"=>51.4700223, "lng"=>-0.4542955}], ["London Luton Airport ", "United Kingdom ", "LTN ", "EGGW", {"lat"=>51.87626460000001, "lng"=>-0.3717471}], ["London Southend Airport ", "United Kingdom ", "SEN ", "EGMC", {"lat"=>51.5698197, "lng"=>0.7037369}], ["London Stansted Airport ", "United Kingdom ", "STN ", "EGSS", {"lat"=>51.8860181, "lng"=>0.2388661}], ["Manchester Airport ", "United Kingdom ", "MAN ", "EGCC", {"lat"=>53.3588026, "lng"=>-2.2727303}], ["Southampton Airport ", "United Kingdom ", "SOU ", "EGHI", {"lat"=>50.9514562, "lng"=>-1.3577022}], ["Newcastle Airport ", "United Kingdom ", "NCL ", "EGNT", {"lat"=>55.03771520000001, "lng"=>-1.7022861}]]

@located_airports = []
@located_airports_flat.each do |airport|
  new = {}
  new["name"] = airport[0].strip
  new["country"] = airport[1].strip
  new["iata"] = airport[2].strip
  new["icao"] = airport[3]
  new["lat"] = airport[4]["lat"]
  new["lng"] = airport[4]["lng"]
  @located_airports << new
end

File.open("european-airports.json", "w+") do |f|
  f.write(JSON.pretty_generate(@located_airports))
end

