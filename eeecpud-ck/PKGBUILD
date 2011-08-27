# Maintainer: Mika Hynnä <igheax@gmail.com>
# Maintainer: OK <ok100.ok100.ok100@gmail.com>

pkgname=eeecpud-ck
pkgver=0.2
pkgrel=1
pkgdesc="Daemon to change FSB speed on Asus EEE PC 70x Celeron-M CPU on demand. For linux-eee-ck."
arch=('i686')
url="http://www.ighea.com/eeecpud/"
license=('WTFPL')
depends=(eeepc-linux-ck)
source=($url/eeecpud-$pkgver.tar.gz)

build() {
  cd "$srcdir/eeecpud"
  make
}

package() {
  cd "$srcdir/eeecpud"
  make DESTDIR="$pkgdir/" install
}

md5sums=('5b02eee5b67e28ed5878f499e26b2d23')

# vim:set ts=2 sw=2 et:
