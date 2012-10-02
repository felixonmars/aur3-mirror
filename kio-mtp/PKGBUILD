# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=kio-mtp
pkgver=0.70
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Provides KIO Access to MTP devices using the mtp:/// protocol"
url="https://projects.kde.org/projects/playground/base/kio-mtp"
license=('GPL')
depends=('kdebase-runtime' 'libmtp')
makedepends=('cmake' 'automoc4')
source=("kio-mtp.tar.gz::http://quickgit.kde.org/index.php?p=kio-mtp.git&a=snapshot&h=e8fb24d96f002dd7b77cb34adb2eab38c311691c&fmt=tgz")
md5sums=('9a1cdbede24b6eb7032461f09e32b80c')

build() {
  cd $srcdir/$pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd $srcdir/$pkgname/build
  make DESTDIR=$pkgdir install
}
