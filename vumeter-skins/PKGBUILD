# Contributor: Fabio 'AkiraYuki' Memoli <akirayuki@fastwebnet.it>

pkgname=vumeter-skins
pkgver=1.0
pkgrel=1
pkgdesc="Skins made for the XMMS VUmeter plugin"
arch=('i686')
url="http://www.kde-look.org/content/show.php?content=49220"
license=('GPL')
source=(http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-Almond.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-Digiblue.tar.gz     \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-ExpensiveHi-Fi.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-E_0008-v2.0.tar.gz  \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-Seamaster.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VUmeter-NJOY.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VU-Kore.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/VU-ZEN.tar.gz \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/X-skin.tar.bz2 \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/vumeter_by.tar.bz2  \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/vumeter_classic-v2.tar.bz2 \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/vumeter_classic.tar.bz2 \
  http://akirayuki.ath.cx/archlinux/multimedia/vumeter-skins/vuskin.tar.bz2)

md5sums=('ad374b21ab208125cbdb6d2c2515e7a7'
         '68bdd92d083650df905302f448cdaafb'
         'f1b0189a4319a26880ff1fcafb71f74f'
         '4d03d325b92ab22c2e67e274fba70fdd'
         '8bc3da0a8faec0964536286ae6d601a9'
         '1af71807e9fe4089dd44882c9f2d4436'
         '4a1a332f0c296e89e345d85cd8feada7'
         'b82eaeb570fdd3cb28d92bb1f808eb6e'
         'e9da613bfde2b95e3b3960cc38174df0'
         '9d9934b3cf5aafd04c44a2a88843d002'
         '7f0e6ac77351d5c75f9850c6529463ce'
         '6c30e09d85f32f7d08b3ec7083fb1259'
         'b03853712b06d3b1a3a2365c6d405757')

build() {
  mkdir -p $startdir/pkg/usr/share/xmms/VU_Meter_skins
  cd $startdir/src/
  rm *.gz
  rm *.bz2
  cp -p -a -r * $startdir/pkg/usr/share/xmms/VU_Meter_skins
}

