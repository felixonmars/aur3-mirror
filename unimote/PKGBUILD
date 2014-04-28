# Maintainer: Daniel Hillenbrand <codeworkx [at] bbqlinux [dot] org>
pkgname=unimote
pkgver=0.8.0
pkgrel=1
pkgdesc="Most feature-rich bluetooth multimedia remote control application for Android to controll Linux."
arch=('any')
url="http://www.unimote.net"
license=('GPL3')

makedepends=('bluez' 'bluez-libs' 'curl' 'dbus>=1.4.26' 'boost' 'boost-libs>=1.49.0' 'libx11' 'libxtst' 'gcc' 'cmake' 'make')

source=("http://archlinux.unimote.net/$pkgname-$pkgver.tar.gz")
md5sums=('ee48dd2ca90430ae5643a0165d292b69')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
