# Maintainer: perlawk

pkgname=empirical
pkgver=1.0
pkgrel=1
pkgdesc="Date class and etc class for C++ Financial Algoritms (Financial Numerical Recipes)"
arch=('i686' 'x86_64')
url="http://finance.bi.no/~bernt/gcc_prog/recipes/"
license=('custom')
depends=('sh') #  'finrecipes')
optdepends=()
conflicts=()
options=()
source=('http://finance.bi.no/~bernt/gcc_prog/empirical/empirical_progs.tar.gz'
'empirical.patch' 'examples_cc.patch')

md5sums=(f021e6ea123519e4f1985c94a78f2732
84e72303714082bb47ac9661e5752337  
9ba5ca58a18d3a64ec6713396cb73729  
)

build() {
  cd "$srcdir"
	patch -p0 < "$startdir/empirical.patch"
	patch -p0 < "$startdir/examples_cc.patch"
  cd "$srcdir/all_cc_progs"
	
  make -j4 lib

	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/include/empirical
	cp lib*.a ${pkgdir}/usr/lib
	cp *.h ${pkgdir}/usr/include/empirical

  cd "$srcdir/examples_cc"
	make run_examples
}

