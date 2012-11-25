# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=distrho-arctican
pkgver=20120518
pkgrel=1
pkgdesc="These are simple but useful plugins, 'developed as there was nothing similar out there'. In the pack you will find 2 Arctican plugins - 'The Function' and 'The Pilgrim'. Ported to LV2"
url="http://distrho.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/Arctican-Plugins/arctican-plugins_linux64_20120518.7z)
md5sums=('96a7b131e1c0c50b890fe8620ba80435')
build() {
  cd $startdir/src/arctican-plugins_linux64
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{TheFunction.lv2,ThePilgrim.lv2}
  install -m 644 -D lv2/TheFunction.lv2/* $startdir/pkg/usr/lib/lv2/TheFunction.lv2/
  install -m 644 -D lv2/ThePilgrim.lv2/* $startdir/pkg/usr/lib/lv2/ThePilgrim.lv2/
}
