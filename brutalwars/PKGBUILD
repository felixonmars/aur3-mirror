# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=brutalwars
pkgver=1.511
pkgrel=2
pkgdesc="War game and a turn-based strategy, a spiritual successor to Battle Isle"
arch=(i686 x86_64)
url="http://www.brutalwars.com/"
license=('custom:demo')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=('installexplorer' 'cabextract')
source=($pkgname http://www.sytexis.com/bin/brutalwars.1.511.exe)
md5sums=('761e452e5705b7b138f6142db68594e9' '3e284336d031c51bb4fa7a04a2bc155a')
noextract=(brutalwars.1.511.exe)
options=(!strip)

build() {
  cd "$startdir"/src
  installexplorer x brutalwars.1.511.exe app

  cd "$startdir"/src/app

  cabextract -x bw.CAB    

  cd "$startdir"

  install -d -m755 pkg/usr/share/$pkgname

  install -d -m755 pkg/usr/share/$pkgname/{scripts,textures,sounds,lands,maps,extramaps}
  install -d -m755 pkg/usr/share/$pkgname/scripts/{campaigns,shops,strings,units}
  install -d -m755 pkg/usr/share/$pkgname/textures/{interface,shops,units}

cp -a src/app/airbase1.066 pkg/usr/share/$pkgname/scripts/shops/airbase1.xml
cp -a src/app/airbase1.186 pkg/usr/share/$pkgname/textures/shops/airbase1.tga
cp -a src/app/ALPHA-~1.192 pkg/usr/share/$pkgname/textures/units/alpha-img.tga
cp -a src/app/ANNIHI~1.093 pkg/usr/share/$pkgname/scripts/units/annihilator.xml
cp -a src/app/ANNIHI~1.194 pkg/usr/share/$pkgname/textures/units/annihilator-img.tga
cp -a src/app/ANNIHI~2.195 pkg/usr/share/$pkgname/textures/units/annihilator.tga
cp -a src/app/ATLAS-~1.196 pkg/usr/share/$pkgname/textures/units/atlas-img.tga
cp -a src/app/ATTACK~1.139 pkg/usr/share/$pkgname/textures/attackfire.tga
cp -a src/app/BACKSC~1.140 pkg/usr/share/$pkgname/textures/backscreen.tga
cp -a src/app/BARREL~1.200 pkg/usr/share/$pkgname/textures/units/barrel-img.tga
cp -a src/app/BLACKJ~1.097 pkg/usr/share/$pkgname/scripts/units/blackjack.xml
cp -a src/app/BLACKJ~1.202 pkg/usr/share/$pkgname/textures/units/blackjack-img.tga
cp -a src/app/BLACKJ~2.203 pkg/usr/share/$pkgname/textures/units/blackjack-layer.tga
cp -a src/app/BLACKJ~3.204 pkg/usr/share/$pkgname/textures/units/blackjack.tga
cp -a src/app/BMP-3-~1.205 pkg/usr/share/$pkgname/textures/units/bmp-3-img.tga
cp -a src/app/BOR-IM~1.198 pkg/usr/share/$pkgname/textures/units/b.o.r-img.tga
cp -a src/app/BUTTON~1.167 pkg/usr/share/$pkgname/textures/interface/button-attack.tga
cp -a src/app/BUTTON~2.168 pkg/usr/share/$pkgname/textures/interface/button-build.tga
cp -a src/app/BUTTON~3.169 pkg/usr/share/$pkgname/textures/interface/button-cancel.tga
cp -a src/app/BUTTON~4.170 pkg/usr/share/$pkgname/textures/interface/button-climb.tga
cp -a src/app/BU0AF5~1.171 pkg/usr/share/$pkgname/textures/interface/button-container.tga
cp -a src/app/BU14FE~1.178 pkg/usr/share/$pkgname/textures/interface/button-uparrow.tga
cp -a src/app/BU2E65~1.173 pkg/usr/share/$pkgname/textures/interface/button-downarrow.tga
cp -a src/app/BU6B23~1.176 pkg/usr/share/$pkgname/textures/interface/button-refuel.tga
cp -a src/app/BU6512~1.174 pkg/usr/share/$pkgname/textures/interface/button-move.tga
cp -a src/app/BU690B~1.172 pkg/usr/share/$pkgname/textures/interface/button-dive.tga
cp -a src/app/BU7B11~1.177 pkg/usr/share/$pkgname/textures/interface/button-repair.tga
cp -a src/app/BU7728~1.175 pkg/usr/share/$pkgname/textures/interface/button-reammo.tga
cp -a src/app/CAMPAI~1.061 pkg/usr/share/$pkgname/scripts/campaigns.txt
cp -a src/app/CAMPAI~1.077 pkg/usr/share/$pkgname/scripts/strings/campaigns.xml
cp -a src/app/cellinfo.180 pkg/usr/share/$pkgname/textures/interface/cellinfo.tga
cp -a src/app/contest1.008 pkg/usr/share/$pkgname/extramaps/contest1.bim
cp -a src/app/CONTEX~1.078 pkg/usr/share/$pkgname/scripts/strings/contexthelp.xml
cp -a src/app/COYOTE~1.211 pkg/usr/share/$pkgname/textures/units/coyote-img.tga
cp -a src/app/CRUSHE~1.213 pkg/usr/share/$pkgname/textures/units/crusher-img.tga
cp -a src/app/DEFEND~1.142 pkg/usr/share/$pkgname/textures/defendfire.tga
cp -a src/app/DELTA-~1.215 pkg/usr/share/$pkgname/textures/units/delta-img.tga
cp -a src/app/dreamery.130 pkg/usr/share/$pkgname/sounds/dreamery.ogg
cp -a src/app/EAGLEE~1.104 "pkg/usr/share/$pkgname/scripts/units/eagle eye.xml"
cp -a src/app/EAGLEE~1.217 "pkg/usr/share/$pkgname/textures/units/eagle eye-img.tga"
cp -a src/app/EAGLEE~2.218 "pkg/usr/share/$pkgname/textures/units/eagle eye.tga"
cp -a src/app/EXPL_L~1.131 pkg/usr/share/$pkgname/sounds/expl_large.ogg
cp -a src/app/EXPLOS~1.143 pkg/usr/share/$pkgname/textures/explosion.tga
cp -a src/app/EXPL_S~1.132 pkg/usr/share/$pkgname/sounds/expl_small.ogg
cp -a src/app/FALCON~1.219 pkg/usr/share/$pkgname/textures/units/falcon-img.tga
cp -a src/app/FASTCO~1.181 pkg/usr/share/$pkgname/textures/interface/fastcombat.tga
cp -a src/app/FERDIN~1.106 pkg/usr/share/$pkgname/scripts/units/ferdinand.xml
cp -a src/app/FERDIN~1.221 pkg/usr/share/$pkgname/textures/units/ferdinand-img.tga
cp -a src/app/FERDIN~2.222 pkg/usr/share/$pkgname/textures/units/ferdinand.tga
cp -a src/app/FOREST~1.011 pkg/usr/share/$pkgname/lands/forest-att.land
cp -a src/app/FOREST~2.012 pkg/usr/share/$pkgname/lands/forest-def.land
cp -a src/app/FOREST~3.013 pkg/usr/share/$pkgname/lands/forest-road-att.land
cp -a src/app/FOREST~4.014 pkg/usr/share/$pkgname/lands/forest-road-def.land
cp -a src/app/FORTIF~1.145 pkg/usr/share/$pkgname/textures/fortifications.tga
cp -a src/app/foxhound.107 pkg/usr/share/$pkgname/scripts/units/foxhound.xml
cp -a src/app/foxhound.225 pkg/usr/share/$pkgname/textures/units/foxhound.tga
cp -a src/app/FOXHOU~1.223 pkg/usr/share/$pkgname/textures/units/foxhound-img.tga
cp -a src/app/FOXHOU~2.224 pkg/usr/share/$pkgname/textures/units/foxhound-layer.tga
cp -a src/app/GOGGLE~1.108 "pkg/usr/share/$pkgname/scripts/units/goggle eye.xml"
cp -a src/app/GOGGLE~1.226 "pkg/usr/share/$pkgname/textures/units/goggle eye-img.tga"
cp -a src/app/GOGGLE~2.227 "pkg/usr/share/$pkgname/textures/units/goggle eye.tga"
cp -a src/app/HAMMER~1.228 pkg/usr/share/$pkgname/textures/units/hammer-img.tga
cp -a src/app/HEADQU~1.068 pkg/usr/share/$pkgname/scripts/shops/headquarters1.xml
cp -a src/app/HEADQU~1.188 pkg/usr/share/$pkgname/textures/shops/headquarters1.tga
cp -a src/app/HEALTH~1.146 pkg/usr/share/$pkgname/textures/health_bar.tga
cp -a src/app/HILLS-~1.015 pkg/usr/share/$pkgname/lands/hills-att.land
cp -a src/app/HILLS-~2.016 pkg/usr/share/$pkgname/lands/hills-def.land
cp -a src/app/hind-img.230 pkg/usr/share/$pkgname/textures/units/hind-img.tga
cp -a src/app/CHARGE~1.207 pkg/usr/share/$pkgname/textures/units/charger-img.tga
cp -a src/app/CHECKF~1.005 pkg/usr/share/$pkgname/checkfile.bin
cp -a src/app/CHEETA~1.209 pkg/usr/share/$pkgname/textures/units/cheetah-img.tga
cp -a src/app/INFOPA~1.149 pkg/usr/share/$pkgname/textures/infopanel.tga
cp -a src/app/INTERF~1.079 pkg/usr/share/$pkgname/scripts/strings/interface.xml
cp -a src/app/intrepid.111 pkg/usr/share/$pkgname/scripts/units/intrepid.xml
cp -a src/app/intrepid.233 pkg/usr/share/$pkgname/textures/units/intrepid.tga
cp -a src/app/INTREP~1.232 pkg/usr/share/$pkgname/textures/units/intrepid-img.tga
cp -a src/app/JET_FL~1.133 pkg/usr/share/$pkgname/sounds/jet_flyby.ogg
cp -a src/app/mainfont.151 pkg/usr/share/$pkgname/textures/mainfont.tga
cp -a src/app/MAINFO~1.150 pkg/usr/share/$pkgname/textures/mainfont-gray.tga
cp -a src/app/menuitem.182 pkg/usr/share/$pkgname/textures/interface/menuitem.tga
cp -a src/app/NAVALB~1.069 pkg/usr/share/$pkgname/scripts/shops/navalbase1.xml
cp -a src/app/NAVALB~1.189 pkg/usr/share/$pkgname/textures/shops/navalbase1.tga
cp -a src/app/NEPTUN~1.234 pkg/usr/share/$pkgname/textures/units/neptune-img.tga
cp -a src/app/PALADI~1.236 pkg/usr/share/$pkgname/textures/units/paladin-img.tga
cp -a src/app/PHANTO~1.238 pkg/usr/share/$pkgname/textures/units/phantom-img.tga
cp -a src/app/PLAINS~1.017 pkg/usr/share/$pkgname/lands/plains-att.land
cp -a src/app/PLAINS~2.018 pkg/usr/share/$pkgname/lands/plains-def.land
cp -a src/app/PLAINS~3.019 pkg/usr/share/$pkgname/lands/plains-fort-att.land
cp -a src/app/PLAINS~4.020 pkg/usr/share/$pkgname/lands/plains-fort-def.land
cp -a src/app/PL6911~1.022 pkg/usr/share/$pkgname/lands/plains-road-att.land
cp -a src/app/PL8B43~1.021 pkg/usr/share/$pkgname/lands/plains-road-def.land
cp -a src/app/POLARI~1.240 pkg/usr/share/$pkgname/textures/units/polaris-img.tga
cp -a src/app/ROCKS-~1.023 pkg/usr/share/$pkgname/lands/rocks-att.land
cp -a src/app/ROCKS-~2.024 pkg/usr/share/$pkgname/lands/rocks-def.land
cp -a src/app/SENTRY~1.242 pkg/usr/share/$pkgname/textures/units/sentry-img.tga
cp -a src/app/SHARK-~1.244 pkg/usr/share/$pkgname/textures/units/shark-img.tga
cp -a src/app/SHARK-~2.245 pkg/usr/share/$pkgname/textures/units/shark-layer.tga
cp -a src/app/SMALLF~1.159 pkg/usr/share/$pkgname/textures/smallfont-gray.tga
cp -a src/app/SMALLF~2.160 pkg/usr/share/$pkgname/textures/smallfont.tga
cp -a src/app/SMERCH~1.247 pkg/usr/share/$pkgname/textures/units/smerch-img.tga
cp -a src/app/soldiers.135 pkg/usr/share/$pkgname/sounds/soldiers.ogg
cp -a src/app/STING-~1.249 pkg/usr/share/$pkgname/textures/units/sting-img.tga
cp -a src/app/SUBMAR~1.136 pkg/usr/share/$pkgname/sounds/submarine.ogg
cp -a src/app/SWAMP-~1.025 pkg/usr/share/$pkgname/lands/swamp-att.land
cp -a src/app/SWAMP-~2.026 pkg/usr/share/$pkgname/lands/swamp-def.land
cp -a src/app/SWAMP-~3.027 pkg/usr/share/$pkgname/lands/swamp-fort-att.land
cp -a src/app/SWAMP-~4.028 pkg/usr/share/$pkgname/lands/swamp-fort-def.land
cp -a src/app/THUNDE~1.121 pkg/usr/share/$pkgname/scripts/units/thunderbolt.xml
cp -a src/app/THUNDE~1.253 pkg/usr/share/$pkgname/textures/units/thunderbolt-img.tga
cp -a src/app/THUNDE~2.254 pkg/usr/share/$pkgname/textures/units/thunderbolt.tga
cp -a src/app/TICOND~1.122 pkg/usr/share/$pkgname/scripts/units/ticonderoga.xml
cp -a src/app/TICOND~1.255 pkg/usr/share/$pkgname/textures/units/ticonderoga-img.tga
cp -a src/app/TICOND~2.256 pkg/usr/share/$pkgname/textures/units/ticonderoga.tga
cp -a src/app/TOR-M1~1.257 pkg/usr/share/$pkgname/textures/units/tor-m1-img.tga
cp -a src/app/TUTORI~1.060 pkg/usr/share/$pkgname/maps/tutorial0.bim
cp -a src/app/T-90C-~1.251 pkg/usr/share/$pkgname/textures/units/t-90c-img.tga
cp -a src/app/vigilant.124 pkg/usr/share/$pkgname/scripts/units/vigilant.xml
cp -a src/app/vigilant.261 pkg/usr/share/$pkgname/textures/units/vigilant.tga
cp -a src/app/VIGILA~1.259 pkg/usr/share/$pkgname/textures/units/vigilant-img.tga
cp -a src/app/VIGILA~2.260 pkg/usr/share/$pkgname/textures/units/vigilant-layer.tga
cp -a src/app/wasp-img.262 pkg/usr/share/$pkgname/textures/units/wasp-img.tga
cp -a src/app/WATERD~1.033 pkg/usr/share/$pkgname/lands/waterdeep-att.land
cp -a src/app/WATERD~1.164 pkg/usr/share/$pkgname/textures/waterdeep.tga
cp -a src/app/WATERD~2.034 pkg/usr/share/$pkgname/lands/waterdeep-def.land
cp -a src/app/WATERD~3.035 pkg/usr/share/$pkgname/lands/waterdeep-road-att.land
cp -a src/app/WATERD~4.036 pkg/usr/share/$pkgname/lands/waterdeep-road-def.land
cp -a src/app/WATERS~1.037 pkg/usr/share/$pkgname/lands/watershallow-att.land
cp -a src/app/WATERS~1.165 pkg/usr/share/$pkgname/textures/watershallow.tga
cp -a src/app/WATERS~2.038 pkg/usr/share/$pkgname/lands/watershallow-def.land
cp -a src/app/WATERS~3.039 pkg/usr/share/$pkgname/lands/watershallow-road-att.land
cp -a src/app/WATERS~4.040 pkg/usr/share/$pkgname/lands/watershallow-road-def.land
cp -a src/app/WATER-~1.029 pkg/usr/share/$pkgname/lands/water-att.land
cp -a src/app/WATER-~2.030 pkg/usr/share/$pkgname/lands/water-def.land
cp -a src/app/WATER-~3.031 pkg/usr/share/$pkgname/lands/water-road-att.land
cp -a src/app/WATER-~4.032 pkg/usr/share/$pkgname/lands/water-road-def.land
cp -a src/app/WEAPON~1.166 pkg/usr/share/$pkgname/textures/weapon-type.tga
cp -a src/app/WHALE-~1.264 pkg/usr/share/$pkgname/textures/units/whale-img.tga
cp -a src/app/WHALE-~2.265 pkg/usr/share/$pkgname/textures/units/whale-layer.tga
cp -a src/app/WORKSH~1.070 pkg/usr/share/$pkgname/scripts/shops/workshop1.xml
cp -a src/app/WORKSH~1.190 pkg/usr/share/$pkgname/textures/shops/workshop1.tga
cp -a src/app/WORKSH~2.071 pkg/usr/share/$pkgname/scripts/shops/workshop2.xml
cp -a src/app/WORKSH~2.191 pkg/usr/share/$pkgname/textures/shops/workshop2.tga
cp -a src/app/0afghan0.041 pkg/usr/share/$pkgname/maps/afghan0.bim
cp -a src/app/0afghan0.072 pkg/usr/share/$pkgname/scripts/strings/afghan0.xml
cp -a src/app/0afghan1.042 pkg/usr/share/$pkgname/maps/afghan1.bim
cp -a src/app/0afghan1.073 pkg/usr/share/$pkgname/scripts/strings/afghan1.xml
cp -a src/app/0afghan2.043 pkg/usr/share/$pkgname/maps/afghan2.bim
cp -a src/app/0afghan2.074 pkg/usr/share/$pkgname/scripts/strings/afghan2.xml
cp -a src/app/0afghan3.044 pkg/usr/share/$pkgname/maps/afghan3.bim
cp -a src/app/0afghan3.075 pkg/usr/share/$pkgname/scripts/strings/afghan3.xml
cp -a src/app/0afghan4.045 pkg/usr/share/$pkgname/maps/afghan4.bim
cp -a src/app/0afghan4.076 pkg/usr/share/$pkgname/scripts/strings/afghan4.xml
cp -a src/app/0crusher.102 pkg/usr/share/$pkgname/scripts/units/crusher.xml
cp -a src/app/0crusher.214 pkg/usr/share/$pkgname/textures/units/crusher.tga
cp -a src/app/0charger.099 pkg/usr/share/$pkgname/scripts/units/charger.xml
cp -a src/app/0charger.208 pkg/usr/share/$pkgname/textures/units/charger.tga
cp -a src/app/0cheetah.100 pkg/usr/share/$pkgname/scripts/units/cheetah.xml
cp -a src/app/0cheetah.210 pkg/usr/share/$pkgname/textures/units/cheetah.tga
cp -a src/app/0chopper.127 pkg/usr/share/$pkgname/sounds/chopper.ogg
cp -a src/app/0neptune.112 pkg/usr/share/$pkgname/scripts/units/neptune.xml
cp -a src/app/0neptune.235 pkg/usr/share/$pkgname/textures/units/neptune.tga
cp -a src/app/0objects.153 pkg/usr/share/$pkgname/textures/objects.tga
cp -a src/app/0paladin.113 pkg/usr/share/$pkgname/scripts/units/paladin.xml
cp -a src/app/0paladin.237 pkg/usr/share/$pkgname/textures/units/paladin.tga
cp -a src/app/0phantom.114 pkg/usr/share/$pkgname/scripts/units/phantom.xml
cp -a src/app/0phantom.239 pkg/usr/share/$pkgname/textures/units/phantom.tga
cp -a src/app/0polaris.115 pkg/usr/share/$pkgname/scripts/units/polaris.xml
cp -a src/app/0polaris.241 pkg/usr/share/$pkgname/textures/units/polaris.tga
cp -a src/app/0single0.058 pkg/usr/share/$pkgname/maps/single0.bim
cp -a src/app/0single0.090 pkg/usr/share/$pkgname/scripts/strings/single0.xml
cp -a src/app/0single1.059 pkg/usr/share/$pkgname/maps/single1.bim
cp -a src/app/00barrel.096 pkg/usr/share/$pkgname/scripts/units/barrel.xml
cp -a src/app/00barrel.201 pkg/usr/share/$pkgname/textures/units/barrel.tga
cp -a src/app/00button.179 pkg/usr/share/$pkgname/textures/interface/button.tga
cp -a src/app/00click1.128 pkg/usr/share/$pkgname/sounds/click1.ogg
cp -a src/app/00click2.129 pkg/usr/share/$pkgname/sounds/click2.ogg
cp -a src/app/00coyote.101 pkg/usr/share/$pkgname/scripts/units/coyote.xml
cp -a src/app/00coyote.212 pkg/usr/share/$pkgname/textures/units/coyote.tga
cp -a src/app/00cursor.141 pkg/usr/share/$pkgname/textures/cursor.tga
cp -a src/app/00extra1.009 pkg/usr/share/$pkgname/extramaps/extra1.bim
cp -a src/app/00extra2.010 pkg/usr/share/$pkgname/extramaps/extra2.bim
cp -a src/app/00falcon.105 pkg/usr/share/$pkgname/scripts/units/falcon.xml
cp -a src/app/00falcon.220 pkg/usr/share/$pkgname/textures/units/falcon.tga
cp -a src/app/00forest.144 pkg/usr/share/$pkgname/textures/forest.tga
cp -a src/app/00hammer.109 pkg/usr/share/$pkgname/scripts/units/hammer.xml
cp -a src/app/00hammer.229 pkg/usr/share/$pkgname/textures/units/hammer.tga
cp -a src/app/00multi0.056 pkg/usr/share/$pkgname/maps/multi0.bim
cp -a src/app/00multi1.057 pkg/usr/share/$pkgname/maps/multi1.bim
cp -a src/app/00plains.155 pkg/usr/share/$pkgname/textures/plains.tga
cp -a src/app/00select.183 pkg/usr/share/$pkgname/textures/interface/select.tga
cp -a src/app/00sentry.116 pkg/usr/share/$pkgname/scripts/units/sentry.xml
cp -a src/app/00sentry.243 pkg/usr/share/$pkgname/textures/units/sentry.tga
cp -a src/app/00smerch.118 pkg/usr/share/$pkgname/scripts/units/smerch.xml
cp -a src/app/00smerch.248 pkg/usr/share/$pkgname/textures/units/smerch.tga
cp -a src/app/00stylus.184 pkg/usr/share/$pkgname/textures/interface/stylus.tga
cp -a src/app/00tor-m1.123 pkg/usr/share/$pkgname/scripts/units/tor-m1.xml
cp -a src/app/00tor-m1.258 pkg/usr/share/$pkgname/textures/units/tor-m1.tga
cp -a src/app/00traces.162 pkg/usr/share/$pkgname/textures/traces.tga
cp -a src/app/00window.185 pkg/usr/share/$pkgname/textures/interface/window.tga
cp -a src/app/000alpha.092 pkg/usr/share/$pkgname/scripts/units/alpha.xml
cp -a src/app/000alpha.193 pkg/usr/share/$pkgname/textures/units/alpha.tga
cp -a src/app/000atlas.094 pkg/usr/share/$pkgname/scripts/units/atlas.xml
cp -a src/app/000atlas.197 pkg/usr/share/$pkgname/textures/units/atlas.tga
cp -a src/app/000base1.067 pkg/usr/share/$pkgname/scripts/shops/base1.xml
cp -a src/app/000base1.187 pkg/usr/share/$pkgname/textures/shops/base1.tga
cp -a src/app/000bmp-3.098 pkg/usr/share/$pkgname/scripts/units/bmp-3.xml
cp -a src/app/000bmp-3.206 pkg/usr/share/$pkgname/textures/units/bmp-3.tga
cp -a src/app/000BOR~1.095 pkg/usr/share/$pkgname/scripts/units/b.o.r.xml
cp -a src/app/000BOR~1.199 pkg/usr/share/$pkgname/textures/units/b.o.r.tga
cp -a src/app/000delta.103 pkg/usr/share/$pkgname/scripts/units/delta.xml
cp -a src/app/000delta.216 pkg/usr/share/$pkgname/textures/units/delta.tga
cp -a src/app/000hills.147 pkg/usr/share/$pkgname/textures/hills.tga
cp -a src/app/000icons.148 pkg/usr/share/$pkgname/textures/icons.tga
cp -a src/app/000masks.152 pkg/usr/share/$pkgname/textures/masks.tga
cp -a src/app/000order.006 pkg/usr/share/$pkgname/order.url
cp -a src/app/000roads.157 pkg/usr/share/$pkgname/textures/roads.tga
cp -a src/app/000rocks.158 pkg/usr/share/$pkgname/textures/rocks.tga
cp -a src/app/000shark.117 pkg/usr/share/$pkgname/scripts/units/shark.xml
cp -a src/app/000shark.246 pkg/usr/share/$pkgname/textures/units/shark.tga
cp -a src/app/000sting.119 pkg/usr/share/$pkgname/scripts/units/sting.xml
cp -a src/app/000sting.250 pkg/usr/share/$pkgname/textures/units/sting.tga
cp -a src/app/000swamp.161 pkg/usr/share/$pkgname/textures/swamp.tga
cp -a src/app/000truck.138 pkg/usr/share/$pkgname/sounds/truck.ogg
cp -a src/app/000t-90c.120 pkg/usr/share/$pkgname/scripts/units/t-90c.xml
cp -a src/app/000t-90c.252 pkg/usr/share/$pkgname/textures/units/t-90c.tga
cp -a src/app/000units.091 pkg/usr/share/$pkgname/scripts/strings/units.xml
cp -a src/app/000water.163 pkg/usr/share/$pkgname/textures/water.tga
cp -a src/app/000whale.126 pkg/usr/share/$pkgname/scripts/units/whale.xml
cp -a src/app/000whale.266 pkg/usr/share/$pkgname/textures/units/whale.tga
cp -a src/app/0000asia.064 pkg/usr/share/$pkgname/scripts/campaigns/asia.xml
cp -a src/app/0000hind.110 pkg/usr/share/$pkgname/scripts/units/hind.xml
cp -a src/app/0000hind.231 pkg/usr/share/$pkgname/textures/units/hind.tga
cp -a src/app/0000main.065 pkg/usr/share/$pkgname/scripts/campaigns/main.xml
cp -a src/app/0000maps.007 pkg/usr/share/$pkgname/maps.txt
cp -a src/app/0000map0.046 pkg/usr/share/$pkgname/maps/map0.bim
cp -a src/app/0000map0.080 pkg/usr/share/$pkgname/scripts/strings/map0.xml
cp -a src/app/0000map1.047 pkg/usr/share/$pkgname/maps/map1.bim
cp -a src/app/0000map1.081 pkg/usr/share/$pkgname/scripts/strings/map1.xml
cp -a src/app/0000map2.048 pkg/usr/share/$pkgname/maps/map2.bim
cp -a src/app/0000map2.082 pkg/usr/share/$pkgname/scripts/strings/map2.xml
cp -a src/app/0000map3.049 pkg/usr/share/$pkgname/maps/map3.bim
cp -a src/app/0000map3.083 pkg/usr/share/$pkgname/scripts/strings/map3.xml
cp -a src/app/0000map4.050 pkg/usr/share/$pkgname/maps/map4.bim
cp -a src/app/0000map4.084 pkg/usr/share/$pkgname/scripts/strings/map4.xml
cp -a src/app/0000map5.051 pkg/usr/share/$pkgname/maps/map5.bim
cp -a src/app/0000map5.085 pkg/usr/share/$pkgname/scripts/strings/map5.xml
cp -a src/app/0000map6.052 pkg/usr/share/$pkgname/maps/map6.bim
cp -a src/app/0000map6.086 pkg/usr/share/$pkgname/scripts/strings/map6.xml
cp -a src/app/0000map7.053 pkg/usr/share/$pkgname/maps/map7.bim
cp -a src/app/0000map7.087 pkg/usr/share/$pkgname/scripts/strings/map7.xml
cp -a src/app/0000map8.054 pkg/usr/share/$pkgname/maps/map8.bim
cp -a src/app/0000map8.088 pkg/usr/share/$pkgname/scripts/strings/map8.xml
cp -a src/app/0000map9.055 pkg/usr/share/$pkgname/maps/map9.bim
cp -a src/app/0000map9.089 pkg/usr/share/$pkgname/scripts/strings/map9.xml
cp -a src/app/0000pier.154 pkg/usr/share/$pkgname/textures/pier.tga
cp -a src/app/0000rank.156 pkg/usr/share/$pkgname/textures/rank.tga
cp -a src/app/0000ship.134 pkg/usr/share/$pkgname/sounds/ship.ogg
cp -a src/app/0000syms.062 pkg/usr/share/$pkgname/scripts/syms.txt
cp -a src/app/0000tank.137 pkg/usr/share/$pkgname/sounds/tank.ogg
cp -a src/app/0000wasp.125 pkg/usr/share/$pkgname/scripts/units/wasp.xml
cp -a src/app/0000wasp.263 pkg/usr/share/$pkgname/textures/units/wasp.tga
cp -a src/app/000000ui.063 pkg/usr/share/$pkgname/scripts/ui.xml


  cp -a src/app/{bw-pc.exe,fmod.dll} pkg/usr/share/$pkgname
  
  sed -e 's/PLEASE\ READ/\nPLEASE\ READ/' src/app/script.bin | sed -n '/PLEASE\ READ/,/any\ reason\./p' > pkg/usr/share/$pkgname/LICENSE
  
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin

}
