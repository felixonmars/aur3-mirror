# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: James Buckley <xanium4332@gmail.com>
pkgname=libndef
pkgver=1.1.3
pkgrel=1
pkgdesc="C++ library for use in reading and writing messages based on \"NDEF (NFC Data Exchange Format) Specification\""
arch=('i686' 'x86_64')
url="http://code.google.com/p/libndef/"
license=('LGPL3')
depends=('qt')
source=(http://libndef.googlecode.com/files/$pkgname-$pkgver.zip)
md5sums=('ae74590e58802d6100e0d9620bab5b86')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  qmake PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

