# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter Schneider <e.at.chi.kaen@gmail.com>
pkgname=cmunipack
pkgver=2.0.14
pkgrel=1
pkgdesc="Package of software utilities for reducing astronomy CCD images intended on a observation of variable stars"
arch=('x86' 'x86_64')
url="http://c-munipack.sourceforge.net/"
license=('GPL')
depends=(cfitsio gstreamer0.10 gtk2)
source=("http://softlayer-ams.dl.sourceforge.net/project/c-munipack/C-Munipack%202.0%20Stable/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c24c9ed37413f4b352f55e0b604cd6b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
