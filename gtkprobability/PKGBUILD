# Maintainer: Eric Waller <ewwaller dot gmail dot com>
pkgname=gtkprobability
pkgver=9353e1632cd3
pkgrel=1
pkgdesc="Probability Machine Simulator"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ewaller/gtkprobability"
license=('GPL')
groups=(users)
depends=(gtkmm)
makedepends=('make' 'gcc')
source=(https://bitbucket.org/ewaller/gtkprobability/get/9353e1632cd3.tar.gz
	missingfiles.tar.gz)
md5sums=('e0d2444659f4226c1fc6cff7fe633049'
         '46d7713271889a2d28ad11ce3e03382b')
build() {
  cd "$srcdir/ewaller-$pkgname-$pkgver"
  tar -xvf ../../missingfiles.tar.gz
  rm ./INSTALL
  rm ./depcomp
  rm ./install-sh
  rm ./missing

  cp missingfiles/* .
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ewaller-$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
