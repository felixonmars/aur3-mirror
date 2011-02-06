# Contributor: gucong <gucong43216@gmail.com>

pkgname=larceny-bin
pkgver=0.97
pkgrel=2
pkgdesc="A simple and efficient implementation of the Scheme programming language (binary)"
arch=('i686')
license=('LGPL')
url="http://www.larcenists.org/"
depends=('sh')
source=(http://www.larcenists.org/LarcenyReleases/larceny-0.97-bin-native-ia32-linux86.tar.gz)
md5sums=('efbcb56ce9cae8f60cea10016f922760')

build() {
  local LARCENY_ROOT=/usr/lib/larceny
  cd $srcdir/larceny-$pkgver-bin-native-ia32-linux86
  mkdir -p $pkgdir/usr/share/licenses/larceny/
  mv COPYRIGHT $pkgdir/usr/share/licenses/larceny/COPYRIGHT
  mkdir -p $pkgdir/usr/bin
  mv compile-stale larceny twobit scheme-script $pkgdir/usr/bin
  sed -i "s|# LARCENY_ROOT=.*|LARCENY_ROOT=$LARCENY_ROOT|" $pkgdir/usr/bin/larceny
  sed -i "s|# LARCENY_ROOT=.*|LARCENY_ROOT=$LARCENY_ROOT|" $pkgdir/usr/bin/scheme-script
  sed -i "s|# LARCENY_ROOT=.*|LARCENY_ROOT=$LARCENY_ROOT|" $pkgdir/usr/bin/twobit
  mkdir -p $pkgdir/usr/share/doc/larceny
  mv doc examples README-FIRST.txt $pkgdir/usr/share/doc/larceny
  mkdir -p $pkgdir/usr/lib/larceny
  mv * $pkgdir/usr/lib/larceny
}
