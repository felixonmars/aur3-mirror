pkgname=trix11
pkgver=0.0.2
pkgrel=2
pkgdesc="Some simple utilities for X11 systems"
arch=('i686' 'x86_64')
license=('GPL3')
url=('http://dev.gnutelephony.org/gitweb/?p=sources/trix11.git')
source=("http://dev.gnutelephony.org/dist/tarballs/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('c919f564cd3edb2b8171b2a57a1b8cb5'
         'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
