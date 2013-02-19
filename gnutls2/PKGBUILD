pkgname=gnutls2
pkgver=2.12.23
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="gnutls version 2"
url="http://www.gnu.org/software/gnutls/"
license=('GPL' 'LGPL')
source=("ftp://ftp.gnutls.org/gcrypt/gnutls/v2.12/gnutls-$pkgver.tar.bz2")
depends=('zlib' 'libtasn1')
makedepends=('pkg-config')

build() {
	cd $srcdir/gnutls-$pkgver
	./configure --prefix=/usr/gnutls2 --with-libtasn1-prefix=/usr --with-libiconv-prefix=/usr --enable-threads=posix
	make
}

package() {
cd $srcdir/gnutls-$pkgver
make DESTDIR="$pkgdir" install
}

md5sums=('f3c1d34bd5f113395c4be0d5dfc2b7fe')
