# Maintainer: Babets
# Contributor:  Leslie P. Polzer <polzer at stardawn dot org>
pkgname=minizip
pkgver=1.2.8
pkgrel=1
pkgdesc="ZIP file extraction library"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('i686' 'x86_64')
depends=('zlib')
provides=('libminizip')
conflicts=('libminizip')
options=(!libtool)
source=("http://zlib.net/current/zlib-${pkgver}.tar.gz"
        LICENSE)
md5sums=('44d667c142d7cda120332623eab69f40'
         '66b8119e37a80d8bc9d7b1bac59d7d8e')
sha1sums=('a4d316c404ff54ca545ea71a27af7dbc29817088'
          'ad1e3fb070e1b63ae5350d9bb9607a79ecc0a5cd')

build() {
  cd $srcdir/zlib-$pkgver/contrib/$pkgname
  rm Makefile
  autoreconf -i
  autoconf
  automake --add-missing
  automake
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/zlib-$pkgver/contrib/$pkgname
  make install DESTDIR=${pkgdir}
  install -D -m644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
