# Contributor: bender02 at gmx dot com
pkgname=lzmatools
pkgver=4.62.3
pkgrel=1
pkgdesc="lzma encoder/decoder (extremely small, linked against dietlibc)"
arch=('i686' 'x86_64')
url="http://riemann.fmi.uni-sofia.bg/lzma/"
license=("GPL3 and custom:zlib")
makedepends=('dietlibc')
source=(http://riemann.fmi.uni-sofia.bg/lzma/${pkgname}-${pkgver}.tar.gz
        http://zlib.net/zlib-1.2.3.tar.gz)
md5sums=('fe78ff5307bfb21757a372bf4ba55eba'
         'debc62758716a169df9f62e6ab2bc634')

build() {
  cd $srcdir/$pkgname-$pkgver

  # prepare zlib linked against dietlibc
  ln -s $srcdir/zlib-1.2.3.tar.gz || return 1
  make CC='/opt/diet/bin/diet -Os gcc -nostdinc' buildzlib || return 1
  # compile lzma itself
  make CC='/opt/diet/bin/diet -Os gcc -nostdinc' || return 1
  # install
  make DESTDIR=$pkgdir BINDIR=$pkgdir/usr/bin install || return 1
  make DESTDIR=$pkgdir BINDIR=$pkgdir/usr/bin install_other || return 1
}
