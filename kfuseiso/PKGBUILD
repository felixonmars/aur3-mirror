# Maintainer: Pilli <elpilli@gmail.com>

pkgname="kfuseiso"
pkgver=20090816
pkgrel=1
pkgdesc="Small set of modules to help access ISO image files"
arch=('i686' 'x86_64')
license=("GPL")
url="http://kde-apps.org/content/show.php/kfuseiso?content=110509"
depends=('kdebase-lib' 'kdebase-runtime' 'fuseiso')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/110509-${pkgname}-${pkgver}.tar.gz")
md5sums=('da5a7d27857f31f1fac610df081fd60c')

build() {
  if [[ -d "${srcdir}/${pkgname}-${pkgver}/build" ]]; then
    msg2 "Cleaning the previous build directory..."
    rm -rf "${srcdir}/${pkgname}-${pkgver}/build"
  fi
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make	
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}