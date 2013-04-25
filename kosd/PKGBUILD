# Contributor: Bartek Iwaniec <hash87 [at] gmail [dot] com>

pkgname=kosd
pkgver=0.8.1
pkgrel=2
pkgdesc="KOSD is a simple KDE application that runs in the background and responds to button presses by showing a little OSD"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KOSD?content=81457"
license=('GPL')
depends=('kdebase-workspace>=4.5.0')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/81457-${pkgname}-${pkgver}.tar.bz2)
install=${pkgname}.install
md5sums=('4e2e87ba44eb24b26dc832a0e19d5842')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
