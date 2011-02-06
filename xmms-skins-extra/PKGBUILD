# Contributor: Fabio 'AkiraYuki' Memoli <akirayuki@fastwebnet.it>

pkgname=xmms-skins-extra
pkgver=1.0
pkgrel=1
pkgdesc="Skins for XMMS"
arch=('i686')
url="http://www.kde-look.org/content/show.php?content=49220"
license=('GPL')
source=(http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Almond-rounded.zip \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Almond-squared.zip \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-Yellow.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-White.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-Blue.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-Green.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-Red.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/ATER-InfraRed.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Digiblue_v1.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Expensive_Hi-Fi_1.2.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/E_00082-0.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Kore_1.0.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Kore-rd_1.0.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/NJOY_v2.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/NJOY_rd_v2.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/VU-NJOY.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/NJOY_Red_v2.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/NJOY_Green_v2.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/31224-SeaMaster.zip \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Vortigo.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Vortigo-Clear.wsz \
  http://akirayuki.ath.cx/archlinux/multimedia/xmms-skins-extra/Zen_by_k_raki.wsz)

noextract=(ATER-Yellow.wsz ATER-White.wsz ATER-Blue.wsz ATER-Green.wsz
  ATER-Red.wsz ATER-InfraRed.wsz Digiblue_v1.wsz Expensive_Hi-Fi_1.2.wsz 
  E_00082-0.wsz Kore_1.0.wsz Kore-rd_1.0.wsz NJOY_v2.wsz NJOY_rd_v2.wsz 
  VU-NJOY.tar.gz NJOY_Red_v2.wsz 31224-SeaMaster.zip NJOY_Green_v2.wsz 
  Vortigo.wsz Vortigo-Clear.wsz Zen_by_k_raki.wsz)

md5sums=('796088e656ff10d8b98d510713f98103'
         '6be7474fa269dd284c3fdb71e25b2ed4'
         'b366deefe87b650d1fd74e84e62369eb'
         'dfd5be0e32155d166d79791a1abae87a'
         '8696254c9b82fd64679267cd10cbcca4'
         '738c1ac661e86327aa2e2c72d8ba2d4b'
         '86a517727b9e9406c5d6740a753a12d2'
         '2649dc72733560a99f49cea7edb465ea'
         '354215808ae5cb08376fbdfea28e6ede'
         '65d29db0ec21e851bb4cd038b13e305d'
         '9acdab23ff6aedab14ca87c7f5615d2c'
         'df5aacef510cfa5ae7d1fbd98accff82'
         '2c143b9844c120ce84208f0cc754e03a'
         '568a929da59cc23ca0e96aed8a48d3b7'
         '05388c03c0f12f5a157262dc27af8ecb'
         '1af71807e9fe4089dd44882c9f2d4436'
         '0e5fbade7e9a64e4400d1166f7295e10'
         '1ac57c7048f41f2ef24a80516fc9cabb'
         '13b962b55da97d6a291761ecafb0fb30'
         'bc04232efe2c9c2f33d92a7059bb3103'
         '5c3aa8e1b67b62d4354575e4cead1fd0'
         '541c776d0a9d2a9d8724ba6a21819e31')

build() {
  cd $startdir/src/
  rm Almond-rounded.zip Almond-squared.zip
  mkdir -p $startdir/pkg/usr/share/xmms/Skins
  cp -p -a -r * $startdir/pkg/usr/share/xmms/Skins
}

