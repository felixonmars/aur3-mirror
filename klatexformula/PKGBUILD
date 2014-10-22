# Current Maintainer: Mike Dacre <mike@dacre.me>
# Maintainer: Federico Cerruti <druidofdarkforest@gmail.com>
# Submitter: guital <guillemr@gmx.net>

pkgname=klatexformula
pkgver=3.2.11
pkgrel=1
pkgdesc="A program to easily get an image from a LaTeX formula"
url="http://klatexformula.sourceforge.net/"
arch=("i686" "x86_64")
license=('GPL')
depends=('kdebase-runtime' 'texlive-core' 'ghostscript')
makedepends=('cmake' 'automoc4' 'help2man' 'doxygen')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fcc1e40b66e97d99c333e717a88f144a')

build() {
  rm -rf build &>/dev/null
  mkdir build
  cd build
  export PATH=/usr/lib/qt4/bin:$PATH
  sed -i -e 's|epswrite|eps2write|g' ../${pkgname}-${pkgver}/src/klfbackend/klfbackend.cpp
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-lX11 ${CXXFLAGS}" \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
