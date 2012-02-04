# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kfax
pkgver=3.3.6
_kdever=4.2.2
pkgrel=1
pkgdesc="A fax file viewer for the KDE project"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL')
depends=('kdebase-runtime')
makedepends=('pkgconfig' 'cmake' 'automoc4')
options=('docs')
install=${pkgname}.install
source=("http://download.kde.org/stable/${_kdever}/extragear/${pkgname}-${pkgver}.tar.bz2")
md5sums=('043861bbac985938587a564f7a3a3896')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
