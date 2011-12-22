pkgname=libgadu-devel-pre
pkgver=1.11.1
pkgrel=2
pkgdesc="Gadu-Gadu protocol libraries - development version"
arch=('i686' 'x86_64')
url="http://toxygen.net/libgadu/"
license=('GPL')
depends=('gnutls')
provides=('libgadu')
conflicts=('libgadu' 'libgadu-devel')
source=(http://ftp.de.debian.org/debian/pool/main/libg/libgadu/libgadu_1.11.1~pre1+r1230.orig.tar.gz)
md5sums=('a3d1d14e9cd39437fcdcaa1bd489b3ba')
options=('!libtool')

build() {
  cd ${srcdir}/libgadu*
  ./autogen.sh
  ./configure --prefix=/usr \
 	 --disable-static \
	 --enable-shared \
	 --with-pthread \
	 --with-gnutls
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
