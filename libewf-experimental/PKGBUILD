# Maintainer: Jeremy MJ <jskier at gmail dot com>
# Contributor: Jeremy MJ <jskier at gmail dot com>

pkgname=libewf-experimental
pkgver=20140608
pkgrel=1
pkgdesc="An experimental library for support of the Expert Witness Compression Format (EWF)"
url="https://code.google.com/p/libewf/"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=('util-linux-ng' 'zlib' 'openssl')
conflicts=('libewf')
provides=('libewf')
options=(!libtool)
source=(https://googledrive.com/host/0B3fBvzttpiiSMTdoaVExWWNsRjg/${pkgname}-${pkgver}.tar.gz)
sha1sums=('11244b9017542b8f671ab2b659956aa43d10f660')

build() {
  cd "$srcdir"/libewf-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/libewf-${pkgver}
  make DESTDIR="${pkgdir}" install
}
