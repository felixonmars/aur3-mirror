# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=open-cobol
pkgver=1.1
pkgrel=1
pkgdesc="An open-source COBOL compiler"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e38c898e01d50a7ca6bb3e41cfcb0c64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="${CFLAGS} -fno-strict-aliasing" ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/info/dir" > /dev/null
}
