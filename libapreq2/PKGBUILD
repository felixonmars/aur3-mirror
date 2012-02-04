# Maintainer: Andreas Baumann <abaumann at yahoo dot com>

pkgname=libapreq2
pkgver=2.13
pkgrel=1
pkgdesc="Apache HTTP Request Library for Apache 2.x"
arch=('i686' 'x86_64')
url="http://httpd.apache.org/apreq/"
license=('custom')
depends=('apr' 'apr-util' 'expat' 'util-linux')
source=(http://mirror.switch.ch/mirror/apache/dist//httpd/libapreq/${pkgname}-${pkgver}.tar.gz)
md5sums=('c11fb0861aa84dcc6cd0f0798b045eee')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
