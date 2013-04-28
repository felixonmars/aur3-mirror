# Maintainer: Federico Chiacchiaretta <federico.chia at gmail.com>

pkgname=kdeplasma-applets-driveio
pkgver=0.2
pkgrel=1
pkgdesc="A plasmoid to monitor drive activity"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Drive+I%2BO+System+Monitor+Plasmoid?content=132892"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=(http://opendesktop.org/CONTENT/content-files/132892-plasma-applet-sm_driveio.4.10.tgz)
md5sums=('cb106069b4ad56be72cd1dc3031c2eea')

build() {
  cd ${srcdir}/plasma-applet-sm_driveio.4.10
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../plasma-applet-sm_driveio.4.10 \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
}

