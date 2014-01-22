pkgname=kdebase-konsole-with-blurry
_pkgname=konsole
pkgver=4.12.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Terminal patched for transparency with blur effect"
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdebase')
depends=('kdebase-runtime' 'kdebase-lib')
makedepends=('cmake' 'automoc4')
conflicts=('kdebase-konsole')
provides=('kdebase-konsole')
source=("http://download.kde.org/stable/${pkgver}/src/konsole-${pkgver}.tar.xz" "blur.patch")
sha1sums=('d54eab1494b4e36db1f9385273e6fa09260a4e28'
          'eb8cc9c7cd1a2c3b3377c84a0360b9d108aea67e')

build() {

  cd ${_pkgname}-${pkgver}
  echo "Applying patch for transparency with blur effect"
  patch -p1 -i ${srcdir}/blur.patch

  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../konsole-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
