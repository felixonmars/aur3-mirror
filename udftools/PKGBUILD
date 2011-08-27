pkgname=udftools
pkgver=1.0.0b3
pkgrel=5
pkgdesc="Linux UDF tools"
url="http://sourceforge.net/projects/linux-udf/"
license=(GPL)
depends=('ncurses' 'readline')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/linux-udf/$pkgname-$pkgver.tar.gz
        udftools-1.0.0b3.patch.bz2
        gcc4-compile.patch.bz2
        udftools-limits.patch.bz2)
md5sums=('2f491ddd63f31040797236fe18db9e60'
         '5c760ad80d05ca19a88c6c4f503abc6f'
         '494ddf016b05c65c049406359b3238bf'
         '7f037d997f9e22eba2ecd07ffae4d203')
options=(!libtool)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # pktsetup patch from LFS
  patch -p1 -i ../udftools-1.0.0b3.patch
  # this fixes gcc4 compilation, but don't blame me if it doesn't work
  patch -p1 -i ../gcc4-compile.patch
  patch -p1 -i ../udftools-limits.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
