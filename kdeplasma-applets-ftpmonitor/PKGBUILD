# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kdeplasma-applets-ftpmonitor
pkgver=1.1
pkgrel=1
pkgdesc="A simple plasmoid for KDE, which monitors incoming connections to ftp daemons"
url="http://ftpmonitor.googlecode.com/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
conflicts=('ftpmonitor-plasmoid')
replaces=('ftpmonitor-plasmoid')
source=("http://ftpmonitor.googlecode.com/files/ftpmonitor-${pkgver}.tar.bz2")
md5sums=('4d26e9502b5d1ccd21ee25afb5094430')

build() {
  mkdir build
  cd build
  cmake ../ftpmonitor-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}