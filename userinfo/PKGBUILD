# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=userinfo
pkgver=2.3
pkgrel=1
pkgdesc="A console utility to display a variety of information about a local user"
arch=(i686 x86_64)
url="http://benkibbey.wordpress.com/userinfo/"
license=('GPL')
depends=('glibc')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('d0d080c64608b4f931ab21b11d50831b')

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
