# Maintainer: nqn1976 @ gmail.com

pkgname=plasma-applet-lionmail
pkgver=git20110314
pkgrel=2
pkgdesc="A Plasma widget displaying new and important email"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/plasma-lionmail/"
license=('GPL')
source=('http://quickgit.kde.org/?p=plasma-lionmail.git&a=snapshot&h=4ac6486ad0f2092f4cf825c0c934c7959d4dbd8d&fmt=tgz')
md5sums=('9dd52a48c06bbcb668019159ce83048c')
depends=('kdepim-runtime>=4.5.94.1')
makedepends=('cmake' 'automoc4' 'boost')

build() {
  cd ${srcdir}/plasma-lionmail
  mkdir build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/plasma-lionmail/build
  make DESTDIR=${pkgdir} install
}
