# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=logfun
pkgver=1.5.2
pkgrel=1
pkgdesc="Library of logic functors"
arch=(i686 x86_64)
url="http://www.irisa.fr/LIS/ferre/logfun/index.html"
license=('GPL')
depends=('ocaml>=3.08')
source=(http://www.irisa.fr/LIS/ferre/logfun/download/$pkgname-$pkgver.tar.gz)
md5sums=('24776d87a6ef98a787411042a9a9c8bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir$(ocamlc -where)
	make CAMLLIB="$pkgdir$(ocamlc -where)" install
}

