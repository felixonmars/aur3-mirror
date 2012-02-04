# Maintainer: Jan-Niklas Meier <dschanoeh@googlemail.com>
pkgname=can-utils-svn
pkgver=0.0.1
pkgrel=1
pkgdesc="Socket CAN utilities"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/socketcan/"
license=('GPLv2')
groups=()
depends=()
makedepends=(subversion)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

build() {
  svn checkout svn://svn.berlios.de/socketcan/trunk/
  cd trunk/can-utils
  make
}

package() {
  cd trunk/can-utils
  make DESTDIR="$pkgdir/" install
}


