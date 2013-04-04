# Maintainer: snorre <snojen@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>

pkgname=xqilla
pkgver=2.3.0
pkgrel=2
pkgdesc="C++ XQuery and XPath 2 library and command line utility"
arch=('i686' 'x86_64')
url="http://xqilla.sourceforge.net"
license=('ApacheV2')
depends=('gcc-libs')
makedepends=('xerces-c')
options=('!libtool')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/XQilla-$pkgver.tar.gz)
md5sums=('7261c7b4bb5a45cbf6270073976a51ce')

build() {
  cd "$srcdir"/XQilla-$pkgver

  ./configure --prefix=/usr --with-xerces=/usr/ xerces_include_dir=/usr/include/xercesc/

  make
}

package() {
  cd "$srcdir"/XQilla-$pkgver

  make DESTDIR="$pkgdir" install
}
