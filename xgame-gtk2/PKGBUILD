# Contributor: Renato C. Aguiar <renato.rca@gmail.com>

pkgname=xgame-gtk2
pkgver=2.0.2
pkgrel=2
pkgdesc="Script to run any game/program for Linux in a separate X session."
url="http://xgame.tlhiv.org/"
license="GPL"
arch=("any")
depends=('gtk2-perl')
source=(http://dl.dropbox.com/u/17063482/for%20aur.archlinux.org%20%28DO%20NOT%20DELETE%21%29/$pkgname-$pkgver.tar.gz)
md5sums=('f054b20ac5a3c796d212a296866223b0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  cp -f xgame-gtk2 $startdir/pkg/usr/bin
}
