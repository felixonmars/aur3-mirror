# Maintainer: A Rojas < nqn1976 @ gmail.com >
# Contributor: gnumdk

pkgname=plaspool
pkgver=1.2.5
pkgrel=2
pkgdesc="A plasma widget to manage printing jobs"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Plaspool?content=141018"
depends=('kdebase-workspace' 'cups')
makedepends=('cmake' 'automoc4')
source=("http://skylendar.kde.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
license=('GPL')
md5sums=('715df375902ce8ae86518f0c6b4a6070')

build() {
  cd ${srcdir}/${pkgname} 
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR=${pkgdir} install
}
