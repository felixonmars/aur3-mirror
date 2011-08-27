# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=slsnif
pkgver=0.4.4
pkgrel=1
pkgdesc="A serial port logging utility"
arch=(i686 x86_64)
url="http://slsnif.sourceforge.net/"
license=('GPL')
depends=()
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('78eeff8ba36ee0c3a954ec0878d2a997')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

