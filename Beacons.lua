dofile('Scripts/Database/wsTypes.lua')
dofile('Scripts/World/Radio/BeaconTypes.lua')
dofile('Scripts/World/Radio/BeaconSites.lua')

local disableNauticalBeacons = true

local gettext = require("i_18n")
local       _ = gettext.translate

--WORLD BEACONS

--[[
	Persian Gulf beacon mod v.1.0, updated August 5th, 2018.
	
	General info:
	I have added ICLS beacons for the F/A-18C for all runways that are already equipped with regular ILS.
	Instead of using DMEs co-located with the Glide Path(/Slope), I have added TACANS for use in aircraft without separate DME and VOR receivers.
	Three letter IDENT codes are used for TACAN, since the Hornet only displays the first three letters.
	All VORs (except Shiraz, which already has a TACAN) are converted to VORTACs, for use with both VOR and TACAN equiupped aircraft.
	
	Added beacons:
	- Al Ain: VORTAC ch. 73X / 112.6 MHz
	- Al Maktoum: VORTAC ch. 81 / 113.4 MHz
	- Al Maktoum RWY 12: ICLS ch. 8, TACAN ch. 54X
	- Al Maktoum RWY 30: ICLS ch. 12, TACAN ch. 35X
	- Al Minhad: VORTAC ch. 99 / 115.2 MHz
	- Al Minhad RWY 09: ICLS ch. 7, TACAN ch. 44X
	- Al Minhad RWY 27: ICLS ch. 9, TACAN ch. 45X
	- Bandar Abbas: VORTAC ch. 119 / 117.2 MHz
	- Bandar Abbas RWY21L: ICLS ch. 19, TACAN ch. 36X
	- Bandar Lengeh: VORTAC ch. 95 / 114.8 MHz
	- Dubai: VORTAC 21X / 108.4 MHz - new beacon located along the extended centerline of RWY 12L/30R
	- Dubai RWY 12L: ICLS ch. 11, TACAN ch. 38X
	- Dubai RWY 12R: ICLS ch. 15, TACAN ch. 32X
	- Dubai RWY 30L: ICLS ch. 13, TACAN ch. 50X
	- Dubai RWY 30R: ICLS ch. 19, TACAN ch. 46X
	- Fujairah: VORTAC ch. 85X
	- Fujairah RWY 29: ICLS ch. 1, TACAN ch. 40
	- Havadarya RWY 08: ICLS ch. 8, TACAN ch. 26X
	- Kerman: VORTAC ch. 57 / 112.0 MHz
	- Khasab RWY 19: ICLS ch. 3, TACAN ch. 40X
	- Kish Island: VORTAC ch. 121 / 117.4 MHz
	- Lar: VORTAC ch. 126X / 117.9 MHz
	- Lar RWY 09: ICLS ch. 15, TACAN ch. 52X
	- Qeshm Island: VORTAC ch. 118X / 117.1 MHz
	- Ras Al Khaimah: VORTAC ch. 83X / 113.6 MHz
	- Sharjah: VORTAC ch. 70X / 112.3 MHz
	- Sharjah RWY 12L: ICLS ch. 6, TACAN ch. 22X
	- Sharjah RWY 30L: ICLS ch. 20, TACAN ch. 56X
	- Sirri Island: VORTAC ch. 84Y / 113.75 MHz

	
]]--


beaconsTableFormat = 2
beacons = {
	{
		display_name = _('Abumusa');
		beaconId = 'airfield1_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'ABM';
		frequency = 285000.000000;
		position = { -31340.871094, 5.000005, -122275.148438 };
		direction = 174.107027;
		positionGeo = { latitude = 25.877348, longitude = 55.023518 };
		sceneObjects = {'t:428933120'};
	};
	{
		display_name = _('BandarAbbas');
		beaconId = 'airfield2_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'BND';
		frequency = 117200000.000000;
		channel = 119;
		position = { 113480.484375, 5.854269, 13045.339844 };
		direction = 26.337865;
		positionGeo = { latitude = 27.197000, longitude = 56.366833 };
		sceneObjects = {'t:-1265303496'};
	};
	{
		display_name = _('BandarAbbas');
		beaconId = 'airfield2_1';
		type = BEACON_TYPE_HOMER;
		callsign = 'BND';
		frequency = 250000.000000;
		position = { 115560.210938, 16.835809, 12328.879883 };
		direction = 26.337865;
		positionGeo = { latitude = 27.215742, longitude = 56.359493 };
		sceneObjects = {'t:475070464'};
	};
	{
		display_name = _('');
		beaconId = 'airfield2_2';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IBND';
		frequency = 109900000.000000;
		position = { 113693.234375, 5.776140, 13155.006836 };
		direction = 28.001016;
		positionGeo = { latitude = 27.198926, longitude = 56.367930 };
		sceneObjects = {'t:197885952'};
		chartOffsetX = 4544.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield2_3';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IBND';
		frequency = 109900000.000000;
		position = { 116974.781250, 5.880138, 14981.854492 };
		direction = 26.337865;
		positionGeo = { latitude = 27.228633, longitude = 56.386212 };
		sceneObjects = {'t:-1265303495'};
	};
	{
		display_name = _('');
		beaconId = 'airfield2_4';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'BND';
		frequency = 15655000000.000000;
		channel = 19;
		position = { 113693.234375, 5.776140, 13155.006836 };
		direction = 28.001016;
		positionGeo = { latitude = 27.198926, longitude = 56.367930 };
		sceneObjects = {'t:197885952'};
		chartOffsetX = 4544.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield2_5';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'BND';
		frequency = 15655000000.000000;
		channel = 19;
		position = { 116974.781250, 5.880138, 14981.854492 };
		direction = 26.337865;
		positionGeo = { latitude = 27.228633, longitude = 56.386212 };
		sceneObjects = {'t:-1265303495'};
	};
	{
		display_name = _('');
		beaconId = 'airfield2_6';
		type = BEACON_TYPE_TACAN;
		callsign = 'BND';
		frequency = 109900000.000000;
		channel = 36;
		position = { 116974.781250, 5.880138, 14981.854492 };
		direction = 26.337865;
		positionGeo = { latitude = 27.228633, longitude = 56.386212 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _('BandarLengeh');
		beaconId = 'airfield3_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'LEN';
		frequency = 408000.000000;
		position = { 41337.355469, 23.178969, -140284.187500 };
		direction = -1.600031;
		positionGeo = { latitude = 26.530575, longitude = 54.831754 };
		sceneObjects = {'t:435027968'};
	};
	{
		display_name = _('BandarLengeh');
		beaconId = 'airfield3_1';
		type = BEACON_TYPE_VORTAC;
		callsign = 'LEN';
		frequency = 114800000.000000;
		channel = 95;
		position = { 41944.980469, 20.168563, -138343.031250 };
		direction = -1.600031;
		positionGeo = { latitude = 26.536353, longitude = 54.851123 };
		sceneObjects = {'t:435060736'};
	};
	{
		display_name = _('AlDhafra');
		beaconId = 'airfield4_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'MA';
		frequency = 114900000.000000;
		channel = 96;
		position = { -211188.156250, 16.000016, -173477.796875 };
		direction = 37.615738;
		positionGeo = { latitude = 24.246803, longitude = 54.545387 };
		sceneObjects = {'t:335675392'};
	};
	{
		display_name = _('DUBAI');
		beaconId = 'airfield5_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'DO';
		frequency = 265000.000000;
		position = { -103374.234375, 7.304522, -85496.226563 };
		direction = 30.557747;
		positionGeo = { latitude = 25.231649, longitude = 55.399134 };
		sceneObjects = {'t:402423808'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IDBW';
		frequency = 109500000.000000;
		position = { -103160.304688, 5.000005, -85509.226563 };
		direction = -57.960002;
		positionGeo = { latitude = 25.233579, longitude = 55.398979 };
		sceneObjects = {'t:-1265205182'};
		chartOffsetX = 5165.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_2';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IDBR';
		frequency = 110100000.000000;
		position = { -101655.835938, 5.000005, -87173.156250 };
		direction = -58.009998;
		positionGeo = { latitude = 25.246980, longitude = 55.382285 };
		sceneObjects = {'t:-1265205181'};
		chartOffsetX = 4461.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_3';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IDBE';
		frequency = 111300000.000000;
		position = { -100336.234375, 5.000005, -90012.007813 };
		direction = 122.059989;
		positionGeo = { latitude = 25.258581, longitude = 55.353947 };
		sceneObjects = {'t:-1265205180'};
		chartOffsetX = 5340.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_4';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IDBL';
		frequency = 110900000.000000;
		position = { -99354.195313, 5.000005, -90856.460938 };
		direction = 122.069989;
		positionGeo = { latitude = 25.267352, longitude = 55.345444 };
		sceneObjects = {'t:-1265205179'};
		chartOffsetX = 4326.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_5';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IDBL';
		frequency = 110900000.000000;
		position = { -101331.320313, 5.000005, -87516.156250 };
		direction = 123.104971;
		positionGeo = { latitude = 25.249872, longitude = 55.378842 };
		sceneObjects = {'t:-1265205178'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_6';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IDBR';
		frequency = 110100000.000000;
		position = { -99715.640625, 5.000005, -90031.437500 };
		direction = -60.241516;
		positionGeo = { latitude = 25.264181, longitude = 55.353679 };
		sceneObjects = {'t:-1265205177'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_7';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IDBE';
		frequency = 111300000.000000;
		position = { -102607.976563, 5.000005, -86169.898438 };
		direction = 124.706241;
		positionGeo = { latitude = 25.238494, longitude = 55.392357 };
		sceneObjects = {'t:-1265205176'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_8';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IDBW';
		frequency = 109500000.000000;
		position = { -101020.156250, 5.000005, -88667.859375 };
		direction = -57.330628;
		positionGeo = { latitude = 25.252555, longitude = 55.367372 };
		sceneObjects = {'t:-1265205175'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_9';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'DBW';
		frequency = 15535000000.000000;
		channel = 15;
		position = { -103160.304688, 5.000005, -85509.226563 };
		direction = -57.960002;
		positionGeo = { latitude = 25.233579, longitude = 55.398979 };
		sceneObjects = {'t:-1265205182'};
		chartOffsetX = 5165.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_10';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'DBR';
		frequency = 15415000000.000000;
		channel = 11;
		position = { -101655.835938, 5.000005, -87173.156250 };
		direction = -58.009998;
		positionGeo = { latitude = 25.246980, longitude = 55.382285 };
		sceneObjects = {'t:-1265205181'};
		chartOffsetX = 4461.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_11';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'DBE';
		frequency = 15475000000.000000;
		channel = 13;
		position = { -100336.234375, 5.000005, -90012.007813 };
		direction = 122.059989;
		positionGeo = { latitude = 25.258581, longitude = 55.353947 };
		sceneObjects = {'t:-1265205180'};
		chartOffsetX = 5340.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_12';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'DBL';
		frequency = 15655000000.000000;
		channel = 19;
		position = { -99354.195313, 5.000005, -90856.460938 };
		direction = 122.069989;
		positionGeo = { latitude = 25.267352, longitude = 55.345444 };
		sceneObjects = {'t:-1265205179'};
		chartOffsetX = 4326.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield5_13';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'DBL';
		frequency = 15655000000.000000;
		channel = 19;
		position = { -101331.320313, 5.000005, -87516.156250 };
		direction = 123.104971;
		positionGeo = { latitude = 25.249872, longitude = 55.378842 };
		sceneObjects = {'t:-1265205178'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_14';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'DBR';
		frequency = 15415000000.000000;
		channel = 11;
		position = { -99715.640625, 5.000005, -90031.437500 };
		direction = -60.241516;
		positionGeo = { latitude = 25.264181, longitude = 55.353679 };
		sceneObjects = {'t:-1265205177'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_15';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'DBE';
		frequency = 15475000000.000000;
		channel = 13;
		position = { -102607.976563, 5.000005, -86169.898438 };
		direction = 124.706241;
		positionGeo = { latitude = 25.238494, longitude = 55.392357 };
		sceneObjects = {'t:-1265205176'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_16';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'DBW';
		frequency = 15535000000.000000;
		channel = 15;
		position = { -101020.156250, 5.000005, -88667.859375 };
		direction = -57.330628;
		positionGeo = { latitude = 25.252555, longitude = 55.367372 };
		sceneObjects = {'t:-1265205175'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_17';
		type = BEACON_TYPE_TACAN;
		callsign = 'DBL';
		frequency = 110900000.000000;
		channel = 46;
		position = { -101331.320313, 5.000005, -87516.156250 };
		direction = 123.104971;
		positionGeo = { latitude = 25.249872, longitude = 55.378842 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _('');
		beaconId = 'airfield5_18';
		type = BEACON_TYPE_TACAN;
		callsign = 'DBR';
		frequency = 110100000.000000;
		channel = 38;
		position = { -99715.640625, 5.000005, -90031.437500 };
		direction = -60.241516;
		positionGeo = { latitude = 25.264181, longitude = 55.353679 };
		sceneObjects = {'t:-1265074090'};
	};
	
	{
		display_name = _('');
		beaconId = 'airfield5_19';
		type = BEACON_TYPE_TACAN;
		callsign = 'DBE';
		frequency = 111300000.000000;
		channel = 50;
		position = { -102607.976563, 5.000005, -86169.898438 };
		direction = 124.706241;
		positionGeo = { latitude = 25.238494, longitude = 55.392357 };		
		sceneObjects = {'t:-1265074090'};
	};
	
	{
		display_name = _('');
		beaconId = 'airfield5_20';
		type = BEACON_TYPE_TACAN;
		callsign = 'DBW';
		frequency = 109500000.000000;
		channel = 32;
		position = { -101020.156250, 5.000005, -88667.859375 };
		direction = -57.330628;
		positionGeo = { latitude = 25.252555, longitude = 55.367372 };
		sceneObjects = {'t:-1265074090'};
	};
	
	{
		display_name = _('');
		beaconId = 'airfield5_21';
		type = BEACON_TYPE_VORTAC;
		callsign = 'DXB';
		frequency = 108400000.000000;
		channel = 21;
		position = { -102120, 5, -86442 };
		direction = 37.615738;
		positionGeo = { latitude = 25.242767, longitude = 55.389433 };
		sceneObjects = {'t:335675392'};
	};
	{
		display_name = _('AlMaktoumIntl');
		beaconId = 'airfield6_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'JXB';
		frequency = 113400000.000000;
		channel = 81;
		position = { -142027.656250, 37.618499, -107028.085938 };
		direction = -167.121177;
		positionGeo = { latitude = 24.880274, longitude = 55.190583 };
		sceneObjects = {'t:379257130'};
	};
	{
		display_name = _('');
		beaconId = 'airfield6_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IJEA';
		frequency = 111750000.000000;
		position = { -141530.671875, 37.618499, -107812.914063 };
		direction = -58.079994;
		positionGeo = { latitude = 24.884666, longitude = 55.182751 };
		sceneObjects = {'t:-1265172389'};
		chartOffsetX = 5249.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield6_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IJWA';
		frequency = 109750000.000000;
		position = { -141086.531250, 37.618499, -108299.953125 };
		direction = -56.676742;
		positionGeo = { latitude = 24.888616, longitude = 55.177872 };
		sceneObjects = {'t:380174336'};
	};
	{
		display_name = _('');
		beaconId = 'airfield6_3';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IJEA';
		frequency = 111750000.000000;
		position = { -139039.453125, 37.618499, -111508.414063 };
		direction = 121.722933;
		positionGeo = { latitude = 24.906703, longitude = 55.145846 };
		sceneObjects = {'t:-1265172387'};
	};
	{
		display_name = _('');
		beaconId = 'airfield6_4';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IJWA';
		frequency = 109750000.000000;
		position = { -138832.656250, 37.618499, -112149.820313 };
		direction = 121.949994;
		positionGeo = { latitude = 24.908491, longitude = 55.139470 };
		sceneObjects = {'t:-1265172388'};
		chartOffsetX = 5248.000000;
	};
	{
		display_name = _(''); -- RWY 12
		beaconId = 'airfield6_5';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'JEA';
		frequency = 15625000000.000000;
		channel = 8;
		position = { -141530.671875, 37.618499, -107812.914063 };
		direction = -58.079994;
		positionGeo = { latitude = 24.884666, longitude = 55.182751 };
		sceneObjects = {'t:-1265172389'};
		chartOffsetX = 5249.000000;
	};
	{
		display_name = _(''); -- RWY 30
		beaconId = 'airfield6_6';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'JWA';
		frequency = 15445000000.000000;
		channel = 12;
		position = { -141086.531250, 37.618499, -108299.953125 };
		direction = 121.722933;
		positionGeo = { latitude = 24.888616, longitude = 55.177872 };
		sceneObjects = {'t:380174336'};
	};
	{
		display_name = _(''); -- RWY 12
		beaconId = 'airfield6_7';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'JEA';
		frequency = 15625000000.000000;
		channel = 8;
		position = { -139039.453125, 37.618499, -111508.414063 };
		direction = -56.676742;
		positionGeo = { latitude = 24.906703, longitude = 55.145846 };
		sceneObjects = {'t:-1265172387'};
	};
	{
		display_name = _(''); -- RWY 30
		beaconId = 'airfield6_8';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'JWA';
		frequency = 15445000000.000000;
		channel = 12;
		position = { -138832.656250, 37.618499, -112149.820313 };
		direction = 121.949994;
		positionGeo = { latitude = 24.908491, longitude = 55.139470 };
		sceneObjects = {'t:-1265172388'};
		chartOffsetX = 5248.000000;
	};
	{
		display_name = _(''); -- RWY 30
		beaconId = 'airfield6_9';
		type = BEACON_TYPE_TACAN;
		callsign = 'JWA';
		frequency = 109800000.000000;
		channel = 35;
		position = { -141086.531250, 37.618499, -108299.953125 };
		direction = -56.676742;
		positionGeo = { latitude = 24.888616, longitude = 55.177872 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _(''); -- RWY 12
		beaconId = 'airfield6_10';
		type = BEACON_TYPE_TACAN;
		callsign = 'JEA';
		frequency = 111700000.000000;
		channel = 54;
		position = { -139039.453125, 37.618499, -111508.414063 };
		direction = 121.722933;
		positionGeo = { latitude = 24.906703, longitude = 55.145846 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _('Fujairah');
		beaconId = 'airfield7_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'FJV';
		frequency = 113800000.000000;
		channel = 85;
		position = { -118684.765625, 3.201513, 10676.752930 };
		direction = -157.881708;
		positionGeo = { latitude = 25.100651, longitude = 56.354556 };
		sceneObjects = {'t:393838649'};
	};
	{
		display_name = _('');
		beaconId = 'airfield7_1';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IFJR';
		frequency = 111100000.000000;
		position = { -118135.539063, 19.503962, 9027.303711 };
		direction = 112.627742;
		positionGeo = { latitude = 25.105538, longitude = 56.338172 };
		sceneObjects = {'t:-1265139689'};
	};
	{
		display_name = _('');
		beaconId = 'airfield7_2';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IFJR';
		frequency = 111100000.000000;
		position = { -116548.843750, 44.992561, 5567.033203 };
		direction = 112.589986;
		positionGeo = { latitude = 25.119710, longitude = 56.303773 };
		sceneObjects = {'t:-1265139690'};
		chartOffsetX = 4201.000000;
	};
		{
		display_name = _('');
		beaconId = 'airfield7_3';
		type = BEACON_TYPE_TACAN;
		callsign = 'FJR';
		frequency = 110300000.000000;
		channel = 40;
		position = { -118135.539063, 19.503962, 9027.303711 };
		direction = 112.627742;
		positionGeo = { latitude = 25.105538, longitude = 56.338172 };
		sceneObjects = {'t:-1265041393'};
	};	
	{
		display_name = _('');
		beaconId = 'airfield7_4';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'FJR';
		frequency = 15415000000.000000;
		channel = 1;
		position = { -118135.539063, 19.503962, 9027.303711 };
		direction = 112.627742;
		positionGeo = { latitude = 25.105538, longitude = 56.338172 };
		sceneObjects = {'t:-1265139689'};
	};
	{
		display_name = _('');
		beaconId = 'airfield7_5';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'FJR';
		frequency = 15415000000.000000;
		channel = 1;
		position = { -116548.843750, 44.992561, 5567.033203 };
		direction = 112.589986;
		positionGeo = { latitude = 25.119710, longitude = 56.303773 };
		sceneObjects = {'t:-1265139690'};
		chartOffsetX = 4201.000000;
	};
	{
		display_name = _('Havadarya');
		beaconId = 'airfield9_0';
		type = BEACON_TYPE_TACAN;
		callsign = 'HDR';
		frequency = 111000000.000000;
		channel = 47;
		position = { 109557.203125, 11.012902, -6187.317383 };
		direction = -130.596154;
		positionGeo = { latitude = 27.160571, longitude = 56.172924 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _('');
		beaconId = 'airfield9_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IBHD';
		frequency = 108900000.000000;
		position = { 109569.265625, 9.455730, -4889.315430 };
		direction = -100.999995;
		positionGeo = { latitude = 27.160757, longitude = 56.186023 };
		sceneObjects = {'t:-1265074128'};
		chartOffsetX = 2717.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield9_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IBHD';
		frequency = 108900000.000000;
		position = { 109172.148438, 6.802046, -7163.755371 };
		direction = -100.911496;
		positionGeo = { latitude = 27.157037, longitude = 56.163095 };
		sceneObjects = {'t:-1265074127'};
	};
	{
		display_name = _(''); -- RWY 09
		beaconId = 'airfield9_3';
		type = BEACON_TYPE_TACAN;
		callsign = 'BHD';
		frequency = 108900000.000000;
		channel = 26;
		position = { 109172.148438, 6.802046, -7163.755371 };
		direction = -100.911496;
		positionGeo = { latitude = 27.157037, longitude = 56.163095 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _(''); -- RWY 09
		beaconId = 'airfield9_4';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'BHD';
		frequency = 15625000000.000000;
		channel = 8;
		position = { 109569.265625, 9.455730, -4889.315430 };
		direction = -100.999995;
		positionGeo = { latitude = 27.160757, longitude = 56.186023 };
		sceneObjects = {'t:-1265074128'};
		chartOffsetX = 2717.000000;
	};
	{
		display_name = _(''); -- RWY 09
		beaconId = 'airfield9_5';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'BHD';
		frequency = 15625000000.000000;
		channel = 8;
		position = { 109172.148438, 6.802046, -7163.755371 };
		direction = -100.911496;
		positionGeo = { latitude = 27.157037, longitude = 56.163095 };
		sceneObjects = {'t:-1265074127'};
	};
	{
		display_name = _('KERMAN');
		beaconId = 'airfield18_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'KER';
		frequency = 290000.000000;
		position = { 453186.718750, 1751.425580, 71843.406250 };
		direction = 144.697285;
		positionGeo = { latitude = 30.264720, longitude = 56.959325 };
		sceneObjects = {'t:133792405'};
	};
	{
		display_name = _('KERMAN');
		beaconId = 'airfield18_1';
		type = BEACON_TYPE_VORTAC;
		callsign = 'KER';
		frequency = 112000000.000000;
		channel = 57;
		position = { 455450.843750, 1751.425824, 70352.039063 };
		direction = 0.000000;
		positionGeo = { latitude = 30.285146, longitude = 56.943809 };
		sceneObjects = {'t:304185408'};
	};
	{
		display_name = _('Khasab');
		beaconId = 'airfield10_0';
		type = BEACON_TYPE_TACAN;
		callsign = 'KSB';
		frequency = 113700000.000000;
		channel = 84;
		position = { 667.781860, 15.763658, -91.611923 };
		direction = 88.473189;
		positionGeo = { latitude = 26.177844, longitude = 56.240980 };
		sceneObjects = {'t:-1265041393'};
	};
	{
		display_name = _('');
		beaconId = 'airfield10_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IBKS';
		frequency = 110300000.000000;
		position = { -1521.258057, 31.899736, -503.110107 };
		direction = 14.030001;
		positionGeo = { latitude = 26.158057, longitude = 56.236991 };
		sceneObjects = {'t:-1265041400'};
		chartOffsetX = 2627.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield10_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IBKS';
		frequency = 110300000.000000;
		position = { 673.278259, 15.972951, 101.777466 };
		direction = 14.261517;
		positionGeo = { latitude = 26.177903, longitude = 56.242914 };
		sceneObjects = {'t:-1265041399'};
		chartOffsetX = 1000.000000;
	};
		{
		display_name = _('');
		beaconId = 'airfield10_3';
		type = BEACON_TYPE_TACAN;
		callsign = 'BKS';
		frequency = 110300000.000000;
		channel = 40;
		position = { 673.278259, 15.972951, 101.777466 };
		direction = 14.261517;
		positionGeo = { latitude = 26.177903, longitude = 56.242914 };
		sceneObjects = {'t:-1265041393'};
	};
	{
		display_name = _('');
		beaconId = 'airfield10_4';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'BKS';
		frequency = 15475000000.000000;
		channel = 3;
		position = { -1521.258057, 31.899736, -503.110107 };
		direction = 14.030001;
		positionGeo = { latitude = 26.158057, longitude = 56.236991 };
		sceneObjects = {'t:-1265041400'};
		chartOffsetX = 2627.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield10_5';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'BKS';
		frequency = 15475000000.000000;
		channel = 3;
		position = { 673.278259, 15.972951, 101.777466 };
		direction = 14.261517;
		positionGeo = { latitude = 26.177903, longitude = 56.242914 };
		sceneObjects = {'t:-1265041399'};
		chartOffsetX = 1000.000000;
	};
	{
		display_name = _('LAR');
		beaconId = 'airfield11_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'LAR';
		frequency = 117900000.000000;
		channel = 126;
		position = { 168932.671875, 792.860046, -179095.390625 };
		direction = 0.000000;
		positionGeo = { latitude = 27.674948, longitude = 54.416221 };
		sceneObjects = {'t:515735552'};
	};
	{
		display_name = _('');
		beaconId = 'airfield11_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'OISL';
		frequency = 111500000.000000;
		position = { 168963.328125, 798.975591, -180089.718750 };
		direction = -89.651007;
		positionGeo = { latitude = 27.675037, longitude = 54.406142 };
		sceneObjects = {'t:216399872'};
		chartOffsetX = 3885.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield11_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'OISL';
		frequency = 111500000.000000;
		position = { 168903.421875, 803.328928, -183491.234375 };
		direction = -88.808462;
		positionGeo = { latitude = 27.673847, longitude = 54.371698 };
		sceneObjects = {'t:515670094'};
	};
	{
		display_name = _('LAR');
		beaconId = 'airfield11_3';
		type = BEACON_TYPE_HOMER;
		callsign = 'OISL';
		frequency = 224000.000000;
		position = { 168452.046875, 803.328928, -183086.562500 };
		direction = 0.000000;
		positionGeo = { latitude = 27.669854, longitude = 54.375895 };
		sceneObjects = {'t:515670098'};
	};
	{
		display_name = _('');
		beaconId = 'airfield11_4';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'ISL';
		frequency = 15535000000.000000;
		channel = 15;
		position = { 168963.328125, 798.975591, -180089.718750 };
		direction = -89.651007;
		positionGeo = { latitude = 27.675037, longitude = 54.406142 };
		sceneObjects = {'t:216399872'};
		chartOffsetX = 3885.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield11_5';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'ISL';
		frequency = 15535000000.000000;
		channel = 15;
		position = { 168903.421875, 803.328928, -183491.234375 };
		direction = -88.808462;
		positionGeo = { latitude = 27.673847, longitude = 54.371698 };
		sceneObjects = {'t:515670094'};
	};
	{
		display_name = _('');
		beaconId = 'airfield11_6';
		type = BEACON_TYPE_TACAN;
		callsign = 'ISL';
		frequency = 111500000.000000;
		channel = 52;
		position = { 168903.421875, 803.328928, -183491.234375 };
		direction = -88.808462;
		positionGeo = { latitude = 27.673847, longitude = 54.371698 };
		sceneObjects = {'t:-1265074090'};
	};
	{
		display_name = _('Minhad');
		beaconId = 'airfield12_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'MIN';
		frequency = 115200000.000000;
		channel = 99;
		position = { -126012.203125, 56.568256, -86126.000000 };
		direction = -90.145369;
		positionGeo = { latitude = 25.027220, longitude = 55.395556 };
		sceneObjects = {'t:-1265008566'};
	};
	{
		display_name = _('');
		beaconId = 'airfield12_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IMNW';
		frequency = 110700000.000000;
		position = { -126014.757813, 57.834752, -86793.367188 };
		direction = -90.009988;
		positionGeo = { latitude = 25.027125, longitude = 55.388944 };
		sceneObjects = {'t:-1265008565'};
		chartOffsetX = 4567.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield12_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IMNW';
		frequency = 110700000.000000;
		position = { -125893.375000, 52.421538, -90741.046875 };
		direction = -90.145369;
		positionGeo = { latitude = 25.027792, longitude = 55.349815 };
		sceneObjects = {'t:-1265008563'};
	};
	{
		display_name = _('');
		beaconId = 'airfield12_3';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'IMNR';
		frequency = 110750000.000000;
		position = { -126015.968750, 52.421538, -91371.843750 };
		direction = 89.980011;
		positionGeo = { latitude = 25.026616, longitude = 55.343580 };
		sceneObjects = {'t:-1265008564'};
		chartOffsetX = 4549.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield12_4';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'IMNR';
		frequency = 110750000.000000;
		position = { -125895.132813, 58.193624, -87437.218750 };
		direction = 90.000474;
		positionGeo = { latitude = 25.028136, longitude = 55.382550 };
		sceneObjects = {'t:-1265008562'};
	};
	{
		display_name = _(''); -- rwy 09
		beaconId = 'airfield12_5';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'MNW';
		frequency = 15595000000.000000;
		channel = 7;
		position = { -126014.757813, 57.834752, -86793.367188 };
		direction = -90.009988;
		positionGeo = { latitude = 25.027125, longitude = 55.388944 };
		sceneObjects = {'t:-1265008565'};
		chartOffsetX = 4567.000000;
	};
	{
		display_name = _(''); -- rwy 09
		beaconId = 'airfield12_6';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'MNW';
		frequency = 15595000000.000000;
		channel = 7;
		position = { -125893.375000, 52.421538, -90741.046875 };
		direction = -90.145369;
		positionGeo = { latitude = 25.027792, longitude = 55.349815 };
		sceneObjects = {'t:-1265008563'};
	};
	{
		display_name = _(''); -- rwy 27
		beaconId = 'airfield12_7';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'MNR';
		frequency = 15655000000.000000;
		channel = 9;
		position = { -126015.968750, 52.421538, -91371.843750 };
		direction = 89.980011;
		positionGeo = { latitude = 25.026616, longitude = 55.343580 };
		sceneObjects = {'t:-1265008564'};
		chartOffsetX = 4549.000000;
	};
	{
		display_name = _(''); -- rwy 27
		beaconId = 'airfield12_8';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'MNR';
		frequency = 15655000000.000000;
		channel = 9;
		position = { -125895.132813, 58.193624, -87437.218750 };
		direction = 90.000474;
		positionGeo = { latitude = 25.028136, longitude = 55.382550 };
		sceneObjects = {'t:-1265008562'};
	};
	{
		display_name = _(''); -- rwy 09
		beaconId = 'airfield12_9';
		type = BEACON_TYPE_TACAN;
		callsign = 'MNW';
		frequency = 110700000.000000;
		channel = 44;
		position = { -125893.375000, 52.421538, -90741.046875 };
		direction = -90.145369;
		positionGeo = { latitude = 25.027792, longitude = 55.349815 };
		sceneObjects = {'t:-1265008563'};
	};
	{
		display_name = _(''); -- rwy 27
		beaconId = 'airfield12_10';
		type = BEACON_TYPE_TACAN;
		callsign = 'MNR';
		frequency = 110800000.000000;
		channel = 45;
		position = { -125895.132813, 58.193624, -87437.218750 };
		direction = 90.000474;
		positionGeo = { latitude = 25.028136, longitude = 55.382550 };
		sceneObjects = {'t:-1265008562'};
	};
	{
		display_name = _('GheshmIsland');
		beaconId = 'airfield13_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'KHM';
		frequency = 233000.000000;
		position = { 65696.914063, 5.999469, -32833.363281 };
		direction = 141.512093;
		positionGeo = { latitude = 26.762802, longitude = 55.907839 };
		sceneObjects = {'t:443514880'};
	};
	{
		display_name = _('GheshmIsland');
		beaconId = 'airfield13_1';
		type = BEACON_TYPE_VORTAC;
		callsign = 'KHM';
		frequency = 117100000.000000;
		channel = 118;
		position = { 64811.847656, 5.999469, -33663.304688 };
		direction = 0.000000;
		positionGeo = { latitude = 26.754748, longitude = 55.899569 };
		sceneObjects = {'t:78282784'};
	};
	{
		display_name = _('');
		beaconId = 'airfield14_0';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'ISRE';
		frequency = 108550000.000000;
		position = { -93834.992188, 29.999980, -71385.187500 };
		direction = -57.030006;
		positionGeo = { latitude = 25.319219, longitude = 55.538154 };
		sceneObjects = {'t:-1264943044'};
		chartOffsetX = 4492.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield14_1';
		type = BEACON_TYPE_ILS_LOCALIZER;
		callsign = 'ISHW';
		frequency = 111950000.000000;
		position = { -91290.867188, 29.999980, -75307.093750 };
		direction = 122.970016;
		positionGeo = { latitude = 25.341794, longitude = 55.498918 };
		sceneObjects = {'t:-1264943043'};
		chartOffsetX = 4480.000000;
	};
	{
		display_name = _('');
		beaconId = 'airfield14_2';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'ISHW';
		frequency = 111950000.000000;
		position = { -93187.609375, 29.972640, -72018.781250 };
		direction = 121.869334;
		positionGeo = { latitude = 25.325000, longitude = 55.531791 };
		sceneObjects = {'t:-1264943042'};
	};
	{
		display_name = _('');
		beaconId = 'airfield14_3';
		type = BEACON_TYPE_ILS_GLIDESLOPE;
		callsign = 'ISRE';
		frequency = 108550000.000000;
		position = { -91604.445313, 29.999980, -74424.015625 };
		direction = -57.111762;
		positionGeo = { latitude = 25.339053, longitude = 55.507725 };
		sceneObjects = {'t:-1264943041'};
	};
	{
		display_name = _('Sharjah');  
		beaconId = 'airfield14_4';
		type = BEACON_TYPE_VORTAC;
		callsign = 'SHJ';
		frequency = 112300000.000000;
		channel = 70;
		position = { -92371.390625, 28.209940, -73056.312500 };
		direction = 122.888246;
		positionGeo = { latitude = 25.332266, longitude = 55.521396 };
		sceneObjects = {'t:408617017'};
	};
		{
		display_name = _(''); -- 12L
		beaconId = 'airfield14_5';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'SRE';
		frequency = 15565000000.000000;
		channel = 6;
		position = { -93834.992188, 29.999980, -71385.187500 };
		direction = -57.030006;
		positionGeo = { latitude = 25.319219, longitude = 55.538154 };
		sceneObjects = {'t:-1264943044'};
		chartOffsetX = 4492.000000;
	};
	{
		display_name = _(''); -- 30R
		beaconId = 'airfield14_6';
		type = BEACON_TYPE_ICLS_LOCALIZER;
		callsign = 'SHW';
		frequency = 15685000000.000000;
		channel = 20;
		position = { -91290.867188, 29.999980, -75307.093750 };
		direction = 122.970016;
		positionGeo = { latitude = 25.341794, longitude = 55.498918 };
		sceneObjects = {'t:-1264943043'};
		chartOffsetX = 4480.000000;
	};
	{
		display_name = _(''); -- 30R
		beaconId = 'airfield14_7';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'SHW';
		frequency = 15685000000.000000;
		channel = 20;
		position = { -93187.609375, 29.972640, -72018.781250 };
		direction = 121.869334;
		positionGeo = { latitude = 25.325000, longitude = 55.531791 };
		sceneObjects = {'t:-1264943042'};
	};
	{
		display_name = _(''); -- 12L
		beaconId = 'airfield14_8';
		type = BEACON_TYPE_ICLS_GLIDESLOPE;
		callsign = 'SRE';
		frequency = 15565000000.000000;
		channel = 6;
		position = { -91604.445313, 29.999980, -74424.015625 };
		direction = -57.111762;
		positionGeo = { latitude = 25.339053, longitude = 55.507725 };
		sceneObjects = {'t:-1264943041'};
	};
		{
		display_name = _(''); -- rwy 12L
		beaconId = 'airfield14_9';
		type = BEACON_TYPE_TACAN;
		callsign = 'SRE';
		frequency = 108550000.000000;
		channel = 22;
		position = { -91604.445313, 29.999980, -74424.015625 };
		direction = -57.111762;
		positionGeo = { latitude = 25.339053, longitude = 55.507725 };
		sceneObjects = {'t:-1265008562'};
	};
	{
		display_name = _(''); -- rwy 30R
		beaconId = 'airfield14_10';
		type = BEACON_TYPE_TACAN;
		callsign = 'SHW';
		frequency = 111900000.000000;
		channel = 56;
		position = { -93187.609375, 29.972640, -72018.781250 };
		direction = 121.869334;
		positionGeo = { latitude = 25.325000, longitude = 55.531791 };
		sceneObjects = {'t:-1265008562'};
	};
	{
		display_name = _('SHIRAZ');
		beaconId = 'airfield19_0';
		type = BEACON_TYPE_VOR_DME;
		callsign = 'SYZ';
		frequency = 117800000.000000;
		channel = 125;
		position = { 381030.062500, 1487.001487, -351865.593750 };
		direction = -153.938912;
		positionGeo = { latitude = 29.540193, longitude = 52.588744 };
		sceneObjects = {'t:122491860'};
	};
	{
		display_name = _('SHIRAZ');
		beaconId = 'airfield19_1';
		type = BEACON_TYPE_TACAN;
		callsign = 'SYZ1';
		frequency = 114700000.000000;
		channel = 94;
		position = { 381238.562500, 1487.001487, -352249.281250 };
		direction = -153.938912;
		positionGeo = { latitude = 29.541938, longitude = 52.584714 };
		sceneObjects = {'t:651165847'};
	};
	{
		display_name = _('SHIRAZ');
		beaconId = 'airfield19_2';
		type = BEACON_TYPE_HOMER;
		callsign = 'SR';
		frequency = 205000.000000;
		position = { 379775.937500, 1487.001365, -350896.250000 };
		direction = 0.000000;
		positionGeo = { latitude = 29.529239, longitude = 52.599209 };
		sceneObjects = {'t:649756715'};
	};
	{
		display_name = _('SirriIsland');
		beaconId = 'airfield15_0';
		type = BEACON_TYPE_HOMER;
		callsign = 'SIR';
		frequency = 300000.000000;
		position = { -27844.582031, 5.338042, -169988.296875 };
		direction = 38.778616;
		positionGeo = { latitude = 25.901625, longitude = 54.546971 };
		sceneObjects = {'t:75893228'};
	};
	{
		display_name = _('SirriIsland');
		beaconId = 'airfield15_1';
		type = BEACON_TYPE_VORTAC;
		callsign = 'SIR';
		frequency = 113750000.000000;
		channel = 84;
		position = { -26408.787109, 8.874265, -171201.140625 };
		direction = 0.000000;
		positionGeo = { latitude = 25.914373, longitude = 54.534604 };
		sceneObjects = {'t:75890968'};
	};
	{
		display_name = _('Kochak');
		beaconId = 'airfield16_0';
		type = BEACON_TYPE_TACAN;
		callsign = 'KCK';
		frequency = 114200000.000000;
		channel = 89;
		position = { 8918.999023, 4.131644, -109438.015625 };
		direction = -7.639437;
		positionGeo = { latitude = 26.242384, longitude = 55.145874 };
		sceneObjects = {'t:182976541'};
	};
	{
		display_name = _('Kish');
		beaconId = 'world_0';
		type = BEACON_TYPE_VORTAC;
		callsign = 'KIS';
		frequency = 117400000.000000;
		channel = 121;
		position = { 42498.050781, 20.856592, -226966.140625 };
		direction = 0.000000;
		positionGeo = { latitude = 26.525169, longitude = 53.962352 };
		sceneObjects = {'t:77103104'};
	};
	{
		display_name = _('AlAin');
		beaconId = 'world_1';
		type = BEACON_TYPE_VORTAC;
		callsign = 'ALN';
		frequency = 112600000.000000;
		channel = 73;
		position = { -211213.640625, 243.331756, -65684.554688 };
		direction = 0.000000;
		positionGeo = { latitude = 24.260000, longitude = 55.606667 };
		sceneObjects = {'t:57704455'};
	};
	{
		display_name = _('RasAlKhaiman');
		beaconId = 'world_2';
		type = BEACON_TYPE_VORTAC;
		callsign = 'RAV';
		frequency = 113600000.000000;
		channel = 83;
		position = { -64417.347656, 30.405420, -30027.595703 };
		direction = 0.000000;
		positionGeo = { latitude = 25.588333, longitude = 55.946667 };
		sceneObjects = {'t:73860331'};
	};
}
