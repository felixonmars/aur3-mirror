# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>
pkgname=uhidled
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool for controlling LED's attached to U-Hid device (i.e. Pac-Drive)."
arch=('any')
url="http://www.ultimarc.com"
license=('GPL')
depends=('libusb' 'libhid' 'glibc')
install=uhidled.install
changelog=ChangeLog
source=("http://www.ultimarc.com/$pkgname-$pkgver.tar.gz")
md5sums=('5a19da5fa1aabb1db93b41e5b0c39fa1')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {

  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
