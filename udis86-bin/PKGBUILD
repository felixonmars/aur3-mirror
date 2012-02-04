# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>
pkgname=udis86-bin
_srcname=udis86
pkgver=1.7
pkgrel=1
pkgdesc="Disassembler Library for x86 and x86-64, command-line tool."
arch=('i686' 'x86_64')
url="http://udis86.sourceforge.net/"
license=('BSD')
source=(http://downloads.sourceforge.net/udis86/$_srcname-$pkgver.tar.gz)
md5sums=('e279108e10f774e6c3af83caa18f5dc3')

build() {
  cd $startdir/src/$_srcname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -f $startdir/pkg/usr/include/{udis86.h,libudis86/{extern.h,itab.h,types.h}} || return 1
  rmdir $startdir/pkg/usr/include/libudis86/ || return 1
  rmdir $startdir/pkg/usr/include/ || return 1
  rm -f $startdir/pkg/usr/lib/{libudis86.a,libudis86.la} || return 1
  rmdir  $startdir/pkg/usr/lib || return 1
}
