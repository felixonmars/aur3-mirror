# Maintainer: flareguner <flareguner@gmail.com>

pkgname=qphoenix-git
pkgver=9999
pkgrel=1
pkgdesc="The powerful translator on Qt5 - GIT version"
arch=("i686" "x86_64")
url="https://github.com/flareguner/qphoenix"
license=('GPL3')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'git')
conflicts=('qphoenix')
provides=('qphoenix')
source=(git://github.com/flareguner/qphoenix.git)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/qphoenix"
    git describe --always | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/qphoenix"
   cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  make 
}

package(){
  cd "${srcdir}/qphoenix"
  make install DESTDIR=${pkgdir}
}
