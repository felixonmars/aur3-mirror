# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=pcsx-plugin-padjoy
pkgver=0.82
pkgrel=1
pkgdesc="Joy-device plugin"
url="http://www.ammoq.com"
depends=('pcsx' 'gtk')
arch=(i686 x86_64)
license=(GPL2)
source=(http://members.chello.at/erich.kitzmueller/ammoq/down/padJoy082.tgz)

md5sums=('510fde521e641f002f39d132e56b6811')

build() {

  cd $srcdir/padJoy
  mkdir -p $pkgdir/usr/lib/games/psemu
  make -C src && install -m 755 src/cfgPadJoy $pkgdir/usr/lib/games/psemu/ && install -m 755 src/libpadJoy* $pkgdir/usr/lib/games/psemu/

}
