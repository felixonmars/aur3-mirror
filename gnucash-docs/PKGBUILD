# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=gnucash-docs
pkgver=2.4.2
pkgrel=1
pkgdesc="User documentation for gnucash"
arch=('any')
url="http://www.gnucash.org"
license=('GPL')
depends=('gnucash' 'docbook-xml' 'rarian' 'yelp')
source=(http://downloads.sourceforge.net/gnucash/${pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('5c9615f361ae1fc1560cdcc3701ab5c3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
