# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=scheme-widget-library
pkgver=1.0d
pkgrel=1 
pkgdesc="A free windowing and graphics package for Chez Scheme."
url="http://www.scheme.com/"
arch=('i686' 'x86_64')
depends=('petite-chez-scheme-nothreads' 'tk')
license=('custom')
source=(http://www.scheme.com/download/swl$pkgver-src.tar.gz)
md5sums=('db24ecdadfb1d7fa365f12bf80b3bd4c')
build() {
  cd $startdir/src/swl$pkgver
  make
  sed -i config.make -e "s#/usr#$startdir/pkg/usr#"
  make install
  sed -i $startdir/pkg/usr/bin/swl -e "s#$startdir/pkg/usr#/usr#g"
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  cp $startdir/src/swl$pkgver/swl-lic.html $startdir/pkg/usr/share/licenses/$pkgname/
  chmod -R a+r $startdir/pkg
}
