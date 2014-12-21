# Maintainer: ledti <antegist at gmail.com>

# This package builds and installs a stand-alone, developmental version of
# Krita which conflicts with most or all of the Calligra suite found in
# the extra repository.

pkgname=krita-frameworks-git
_pkgname=calligra
pkgver=94853.dce58e9d
pkgrel=1
pkgdesc="Digital painting and illustration suite (stand-alone)."
arch=('i686' 'x86_64')
url="http://www.krita.org/"
license=('GPL2')
depends=('eigen' 'exiv2' 'fftw' 'glew' 'kdebase-runtime' 'libkdcraw-frameworks-git'
         'libpng' 'opencolorio' 'gsl')
makedepends=('automoc4' 'boost' 'cmake' 'git' 'lcms2' 'openjpeg' 'vc')
provides=('calligra-krita')
conflicts=('calligra-krita' 'calligra-plugins' 'calligra-libs' 'calligra-extras' 'krita-git')
install=krita.install
source=("$_pkgname::git://anongit.kde.org/calligra#branch=calligra/2.9")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir krita-build
}

build() {
  cd "$srcdir/$_pkgname/krita-build"
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DPRODUCTSET=KRITA \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname/krita-build"
  make DESTDIR="$pkgdir" install
}
