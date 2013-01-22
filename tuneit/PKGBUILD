# Maintainer: Army
# Contributor: Jochen Immendörfer <jochen dot immendoerfer at gmail dot com>
pkgname=tuneit
pkgver=0.3
pkgrel=3
pkgdesc="a simple command-line instrument tuner for Linux"
arch=('i686' 'x86_64')
url="http://delysid.org/tuneit.html"
license=('GPL2')
depends=('jack' 'fftw')
source=(http://delysid.org/$pkgname-$pkgver.tar.gz patch)
md5sums=('b22dcdc92982bcf56c4ae85d6b8e9b3b'
         '1e5d1d9c11bd1dca4f4bf0f1b58678bf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -i "$srcdir/patch"
  ./configure --prefix=/usr --mandir=/usr/share/man
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
