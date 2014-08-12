# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Adam Wolk <netprobe at gmail dot com>

pkgname=libewf
pkgver=20140608
pkgrel=1
pkgdesc="A library for support of the Expert Witness Compression Format (EWF)"
url="https://code.google.com/p/libewf/"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=('util-linux-ng' 'zlib' 'openssl')
options=(!libtool)
source=(https://53efc0a7187d0baa489ee347026b8278fe4020f6.googledrive.com/host/0B3fBvzttpiiSMTdoaVExWWNsRjg/${pkgname}-${pkgver}.tar.gz)
md5sums=('fdf615f23937fad8e02b60b9e3e5fb35')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
