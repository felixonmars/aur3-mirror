pkgname=libvmime
pkgver=0.9.1
pkgrel=1
pkgdesc="A C++ class library for working with MIME messages"
url="http://www.vmime.org/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig')
depends=('gnutls' 'gsasl')
source=(http://prdownloads.sourceforge.net/sourceforge/vmime/${pkgname}-${pkgver}.tar.bz2) 
md5sums=('d5b6de44f7f9ca0e4cefe597d1905605')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
