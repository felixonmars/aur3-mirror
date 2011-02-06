# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=ttl
pkgver=1.3.2
pkgrel=1
pkgdesc="The Tiny Template Library (TTL) is a free modern C++ template library for generic programming."
url="http://tinytl.sourceforge.net/"
depends=()
makedepends=('unzip')
source=(http://downloads.sourceforge.net/tinytl/ttl_1_3_2.zip)
md5sums=('0e4a7b15b72f6668353255150cc3fe70')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/include/
  cp -r ttl ../pkg/usr/include/
}
