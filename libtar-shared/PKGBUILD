# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=libtar-shared
pkgver=1.2.11
pkgrel=1
pkgdesc="C library for manipulating POSIX tar files"
arch=('i686' 'x86_64')
url="http://www.feep.net/libtar/"
license=('BSD')
depends=('zlib')
provides=('libtar')
conflicts=('libtar')
source=(ftp://ftp.feep.net/pub/software/libtar/libtar-$pkgver.tar.gz \
        libtar-$pkgver-6-debian.patch)
md5sums=('604238e8734ce6e25347a58c4f1a1d7e' '0788363b2237e34586841160ff3ae321')

build() {
  cd $startdir/src/libtar-$pkgver
  patch -p1 -i ../libtar-$pkgver-6-debian.patch || return 1
  cp /usr/share/automake-1.11/config.* autoconf
  autoreconf -f -v -i
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 COPYRIGHT $startdir/pkg/usr/share/licenses/libtar/COPYRIGHT
}
