# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=v4l2grab
pkgver=0.4.1
pkgrel=1
pkgdesc="utility for grabbing JPEGs from V4L2 devices"
arch=(i686 x86_64)
url="http://github.com/twam/v4l2grab"
license=('GPL2')
depends=('v4l-utils')
source=(https://github.com/twam/$pkgname/archive/$pkgver.tar.gz)
md5sums=('d017c9f175a08ddd42a31f5a88155470')
sha256sums=('eac1cf81a4e5c136e7cacf0b2fd8240e5a6f148df1170cc7acf9661654fe78f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sh autogen.sh
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
