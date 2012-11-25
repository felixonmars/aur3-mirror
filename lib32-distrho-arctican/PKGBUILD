# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-arctican
pkgver=20120518
pkgrel=1
pkgdesc="These are simple but useful plugins, 'developed as there was nothing similar out there'. In the pack you will find 2 Arctican plugins - 'The Function' and 'The Pilgrim'. Ported to LV2"
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/Arctican-Plugins/arctican-plugins_linux32_20120518.7z)
md5sums=('c3696b6487bd76fb4b578d4257f7f9bf')
build() {
  cd $startdir/src/arctican-plugins_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{TheFunction.lv2,ThePilgrim.lv2}
  install -m 644 -D lv2/TheFunction.lv2/* $startdir/pkg/usr/lib/lv2/TheFunction.lv2/
  install -m 644 -D lv2/ThePilgrim.lv2/* $startdir/pkg/usr/lib/lv2/ThePilgrim.lv2/
}
