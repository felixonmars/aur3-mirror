# Contributor: Renato C. Aguiar <renato.rca@gmail.com>

pkgname=xgame
pkgver=1.7.1
pkgrel=1
pkgdesc="Script to run any game/program for Linux in a separate X session."
url="http://xgame.tlhiv.org/"
license="GPL"
source=(http://downloads.tlhiv.org/xgame/$pkgname-$pkgver.tar.gz)
md5sums=('e1b3928276285c99e5f5ffe0935dd164')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  cp -f xgame $startdir/pkg/usr/bin
}
