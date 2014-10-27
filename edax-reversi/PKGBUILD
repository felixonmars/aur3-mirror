# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=edax-reversi
pkgver=4.3.2
pkgrel=1
pkgdesc="Edax is a 'state of the art' Othello engine."
arch=('i686' 'x86_64')
url="http://abulmo.perso.neuf.fr/edax/"
license=('GPL3')
source=(http://abulmo.perso.neuf.fr/edax/4.3/edax.4-3-2.zip
        gtp2.sh)
md5sums=('9256cc740789692ed2951427857139e5'
         '6d59e318c046f2820b10e8b741dfe3c7')

prepare() {
# Delete pre-compiled stuff
  cd $srcdir/edax/$pkgver/bin
  find ./ -type f -maxdepth 1 -delete

  # Build type : choose between 'build', 'pgo-build', 'release' or 'debug'.
  target=pgo-build
  
  # Architecture : choose between 'x64-modern', 'x64', 'x32-modern', 'x32' or 'x86'.
  cpu=x64-modern

  # Compiler : choose between 'gcc', 'clang' or 'icc'.
  compiler=gcc
}

build() {
  cd $srcdir/edax/$pkgver/src
  make $target ARCH=$cpu COMP=$compiler OS=linux
}

package() {
  mkdir -p $pkgdir/usr/share/edax-reversi
  cp -rf $srcdir/edax/$pkgver/bin/* $pkgdir/usr/share/edax-reversi

  # GTP engine start file(To use with Quarry GUI)
  install -Dm755 gtp2.sh $pkgdir/usr/share/edax-reversi
  mv $pkgdir/usr/share/edax-reversi/gtp2.sh $pkgdir/usr/share/edax-reversi/gtp.sh
}