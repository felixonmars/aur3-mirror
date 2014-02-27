# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=ovito-scripting-git
pkgver=2.2.4.r1.g2fa5afb
pkgrel=1
pkgdesc="Ovito compiled from source with scripting plugin enabled"
arch=('i686' 'x86_64')
url="http://www.ovito.org/"
license=('GPLv3')
depends=('python2' 'zlib' 'tachyon')
makedepends=('git' 'cmake' 'gcc' 'qt5-base' 'qt5-script' 'qt5-svg' 'qt5-imageformats')
conflicts=('ovito')
md5sums=('')
source=('scripting'::'git+http://git.code.sf.net/p/ovito/git')
_gitname="scripting"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  CC=gcc CXX=g++ cmake ../$_gitname \
            -DCMAKE_BUILD_TYPE=release \
            -DOVITO_BUILD_PLUGIN_SCRIPTING=ON \
            -DCMAKE_INSTALL_PREFIX=$pkgdir
  make
}

package() {
  cd "$srcdir/build"
  make install
} 

