# Contributor: Radu Andries <admiral0@tuxfamily.org>

pkgname=kdevelop-custom-buildsystem
pkgver=1.2.2
pkgrel=1
pkgdesc="Custom buildsystem plugin for KDevelop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/kdevelop/plugins/kdev-custom-buildsystem"
license=('GPL')
depends=("kdevplatform>=1.4.0" "kdevplatform<1.5.0")
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/kdevelop/custom-buildsystem/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a5a26833510281a962d0b68296fce7cd')


build() {
  cd ${srcdir}
  mkdir -p build
  cd build 
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
}
