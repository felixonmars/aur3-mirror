# Contributor: bb <archlinux@gmx.net>
pkgname=xpl2gpl
pkgver=1.0
pkgrel=1
pkgdesc="A utility that converters tcptrace-style xplot input to gnuplot input"
arch=(i686)
url="http://masaka.cs.ohiou.edu/software/tcptrace/xpl2gpl/"
license=('unknown')
install=$pkgname.install
source=(http://www.tcptrace.org/useful/xpl2gpl/$pkgname)
md5sums=(2200b9d8dcdf48e7988b9bff340ce05e)

build() {
  cd $startdir/src/
  install -D -m755 $pkgname $startdir/pkg/usr/bin/$pkgname
}
