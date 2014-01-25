# Maintainer:  perlawk

pkgname=cchr  
pkgver=svn
pkgrel=2 
pkgdesc="CCHR - A CHR-in-C to C compiler, CHR means Constraint Handling Rules."
url="http://people.cs.kuleuven.be/~pieter.wuille/site.php/Research/CCHR"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('svn' 'bison')
install=
source=(cchr.patch)

prepare() {
	cd $srcdir
	if [ ! -e cchr ]; then
		svn -co https://svn.ulyssis.org/repos/sipa/cchr/
	fi
	cd cchr; patch < "$srcdir/cchr.patch"
}

build() {
  cd $srcdir/$pkgname
  make 
}

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/bin
  cp bin/cchr $pkgdir/usr/bin
}
md5sums=('bbb3f590b2d06cdb5682279252a83afb')
