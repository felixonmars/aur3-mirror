# Maintainer: perlawk
pkgname=teyjus-svn
pkgver=1
pkgrel=1127
pkgdesc="The Teyjus system is an efficient implementation of the higher-order logic programming language Lambda Prolog."
url="http://sites.google.com/site/aoeuiandasdfg/Home"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
makedepends=('ocaml' 'omake' 'flex' 'bison' 'subversion') 
source=('svn+http://teyjus.googlecode.com/svn/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/trunk"
  svnversion
}

build() {
  cd "$srcdir/trunk"
  omake
}

package() {
	mkdir -p "$pkgdir/usr/"
  cd "$srcdir/trunk"
	mkdir -p bin
	cp tjcc tjdepend tjdis tjlink tjparse tjsim bin/
 	cp -a bin "$pkgdir/usr/"
}
