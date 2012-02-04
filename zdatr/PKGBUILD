# Maintainer: Moritz Heidkamp <moritz@twoticketsplease.de>
pkgname=zdatr
pkgver=2.0
pkgrel=1
pkgdesc="A DATR compiler and inference engine"
arch=(any)
url="http://coral.lili.uni-bielefeld.de/DATR/Zdatr20.distribution/"
license=('GPL')
makedepends=('gcc' 'flex' 'bison')
source=(http://coral.lili.uni-bielefeld.de/DATR/Zdatr20.distribution/$pkgname-$pkgver.sources.tar.gz)
md5sums=('94d038ea4389d05ba056684b17d22326')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed '/ln -s zdatr/c\	echo skipping creation of zd symlink for zdatr' -i src/Makefile.*
  sed 's, zdatr.bat,,g' -i src/Makefile.*
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

