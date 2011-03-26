pkgname=basic-stamp-tools
pkgver=2006.05.31
pkgrel=2
pkgdesc="The basic-stamp-tools package contains tools to program with the BASIC stamp microcontroller."
url="http://bstamp.sourceforge.net"
depends=('glibc')
arch=('i686')
makedepends=()
backup=()
license=('GPL')
source=(http://dl.sourceforge.net/sourceforge/bstamp/bstamp-$pkgver.tar.gz \
http://www.aofarm.com/movemenot/tokenizer.so \
Makefile.patch)
md5sums=('44b22882bc5931335bcd98eb41c55b04' '534910f67bd6705b23c81a67f1a58572'\
         'fa20895f7ff9285573385f1e996b673c')

build() {
  cd $startdir/src/bstamp
  patch -p0 < ../Makefile.patch || return 1
  make PREFIX=/usr || return 1
  mkdir -p $startdir/pkg/usr/{bin,lib,include}
  make PREFIX=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/dev
  ln -sv /dev/ttyS0 $startdir/pkg/dev/bstamp
  install -D -m755 $startdir/src/tokenizer.so $startdir/pkg/usr/lib/libbstamptokenizer.so
}
