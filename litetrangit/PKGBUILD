# Maintainer: flareguner <flareguner@gmail.com>

pkgname=litetrangit
pkgver=11cfb8d
pkgrel=1
pkgdesc="The powerful translator on Qt5 - GIT version"
arch=("i686" "x86_64")
url="https://github.com/flareguner/litetran"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'git')
conflicts=('litetran')
provides=('litetran')
source=(git://github.com/flareguner/litetran.git)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/litetran"
    git describe --always | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/litetran"
   cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  make 
}

package(){
  cd "${srcdir}/litetran"
  make install DESTDIR=${pkgdir}
}
