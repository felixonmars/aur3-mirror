# Maintainer: perlawk

pkgname=finrecipes
pkgver=1.0
pkgrel=1
pkgdesc="C++ Financial Algoritms (Financial Numerical Recipes)"
arch=('i686' 'x86_64')
url="http://finance.bi.no/~bernt/gcc_prog/recipes/"
license=('custom')
depends=('sh')
optdepends=()
conflicts=()
options=()
source=(http://finance.bi.no/~bernt/gcc_prog/recipes/finrecipes.tar.gz)
md5sums=(1fc83ac6262c07a24eb19db80f8a9b44)  

build() {
  cd "$srcdir/all_cc_progs"
  #./configure --prefix=/usr 
  make -j4 lib

	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/include/finrecipes
	cp lib*.a ${pkgdir}/usr/lib
	cp *.h ${pkgdir}/usr/include/finrecipes

	cd ../examples_cc
	make run_all_examples
}

