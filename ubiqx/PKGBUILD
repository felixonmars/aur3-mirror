# Maintainer:  perlawk

pkgname=ubiqx  
pkgver=0.11
pkgrel=1 
pkgdesc="A C data structure library, include singly/double link list, sparse array, splay tree, AVL tree, bin tree. AmigaOS, Linux, OpenBSD, Irix, etc"
url="http://www.ubiqx.org/proj/modules/index.html"
arch=('i686' 'x86_64')
license=('LGPLv2')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.ubiqx.org/proj/modules/pub/libubiqx.tgz)
md5sums=('ec973a66847f63b083003e724466ccba')
build() {
  cd $startdir/src/$pkgname
  make libubiqx.a || return 1
  install -m755 -d $pkgdir/usr/lib
  install -m755 -d $pkgdir/usr/include/ubiqx
  install -m755 -t $pkgdir/usr/lib libubiqx.a
  install -m755 -t $pkgdir/usr/include/ubiqx library/*h

  make clean
  sed -e 's/CFLAGS = -O2/CFLAGS = -O2 -fPIC/' Makefile > .tmp
  mv .tmp Makefile
  make all
  cc -shared -o libubiqx.so library/*o
  install -m755 -t $pkgdir/usr/lib libubiqx.so
}
