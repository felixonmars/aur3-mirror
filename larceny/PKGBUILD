# Contributor: Victor van den Elzen <victor dot vde at gmail dot com>

pkgname=larceny
pkgver=0.97
pkgrel=1
pkgdesc="A simple and efficient implementation of the Scheme programming language."
url="http://www.ccs.neu.edu/home/will/Larceny/"
arch=('i686')
depends=('sh')
makedepends=('drscheme>=4.0.0' 'nasm')
license=('LGPL')
source=("http://www.ccs.neu.edu/home/will/Larceny/LarcenyReleases/$pkgname-$pkgver-src.tar.gz")
md5sums=('da35e2340b54371122531ddf3b6d3981')

build() {
  cd $srcdir/$pkgname-$pkgver-src
  plt-r5rs --no-prim <<EOF
(load "setup.sch")
(setup 'scheme: 'plt-r5rs 'host: 'linux86 'string-rep: 'flat4 'sassy)
(build-config-files)
(load-compiler)
(build-heap)
(build-runtime)
(build-executable)
(build-larceny-files)
EOF
  ./larceny.bin -stopcopy -- src/Build/iasn-larceny-heap.fasl <<EOF
(exit)
EOF
  ./larceny.bin -stopcopy -- src/Build/iasn-twobit-heap.fasl <<EOF
(exit)
EOF
  cp larceny twobit
  ./larceny <<EOF
(require 'r6rsmode)
(larceny:compile-r6rs-runtime)
(exit)
EOF
  local LARCENY_ROOT=/usr/lib/larceny
  mkdir -p $pkgdir$LARCENY_ROOT
  cp * $pkgdir$LARCENY_ROOT
  cp -r doc examples lib $pkgdir$LARCENY_ROOT
  mkdir -p $pkgdir/usr/bin
  cp larceny $pkgdir/usr/bin
  sed -i "s|# LARCENY_ROOT=.*|LARCENY_ROOT=$LARCENY_ROOT|" $pkgdir/usr/bin/larceny
  cp $pkgdir/usr/bin/larceny $pkgdir/usr/bin/twobit
}
