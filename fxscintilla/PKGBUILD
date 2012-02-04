# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=fxscintilla
pkgver=2.28.0
pkgrel=1
pkgdesc="An implementation of the Scintilla text editing widget for the FOX GUI Library."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/$pkgname/"
license=('LGPL')
depends=('fox')
options=('!libtool')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c4b4512b1fb3f52d0db46730dd99ce39')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-shared=yes
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

