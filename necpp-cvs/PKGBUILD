# Maintainer: Tao-Yi Lee <tylee AT ieee dot org>
pkgname=necpp-cvs
pkgver=1.5.3 
pkgrel=1
pkgdesc="The Numerical Electromagnetics Code (NEC-2) is a comprehensive package for the analysis of the electromagnetic properties of structures."
arch=('i686' 'x86_64')
source=("necpp::git://github.com/tmolteno/necpp.git")
url="https://github.com/tmolteno/necpp"
license=('GPL')
makedepends=(git atlas-lapack)
provides=('necpp')
sha256sums=('SKIP')
options=("!makeflags")

build() {
  cd $pkgname
  make -f Makefile.git
  ./configure --without-lapack
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
