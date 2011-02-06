# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx [dot] de>
pkgname=metapixel
pkgver=1.0.2
pkgrel=1
pkgdesc="Metapixel is a program for generating photomosaics."
arch=('i686' 'x86_64')
url="http://www.complang.tuwien.ac.at/schani/metapixel/"
license=('GPL')
depends=('libungif' 'libjpeg' 'libpng')
makedepends=()
source=(http://www.complang.tuwien.ac.at/schani/metapixel/files/$pkgname-$pkgver.tar.gz)
md5sums=('af5d77d38826756af213a08e3ada9941')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i "s/lgif/lungif/g" Makefile
  sed -i -e "58,58d" Makefile
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}
