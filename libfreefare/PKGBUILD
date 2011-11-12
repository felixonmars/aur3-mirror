# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: James Buckley <xanium4332@gmail.com>
pkgname=libfreefare
pkgver=0.3.2
pkgrel=1
pkgdesc="Provides a convenient API for MIFARE card manipulations"
arch=('i686' 'x86_64')
url="http://code.google.com/p/nfc-tools/"
license=('LGPL3')
depends=('libnfc>=1.5.1')
source=(http://nfc-tools.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('88949547cc58f2d30e005ab9bb30b48c')

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
