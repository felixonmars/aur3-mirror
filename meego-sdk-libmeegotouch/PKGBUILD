# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-libmeegotouch
pkgver=0.20.89
pkgrel=1
_rpmver=1.7
pkgdesc='MeeGo Touch Framework'
arch=('i686' 'x86_64')
url='http://meego.gitorious.org/meegotouch/libmeegotouch'
license=('LGPL2.1')
depends=('meego-sdk-qt')
conflicts=('libmeegotouch-git')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('b97f749af19eed5c5e24cc56a52262bc')

build() {
  cd "${srcdir}"
  tar -zxf libmeegotouch-${pkgver}.tar.gz

  cd libmeegotouch-${pkgver}
  patch -p1 -i ../moc_path.patch

  export QTDIR="/opt/meego/meego-sdk-qt"
  ./configure -prefix=/usr
  cd mgen
  meego-sdk-qmake
  make
  cd ../mmoc
  meego-sdk-qmake
  make
}

package() {
  cd "${srcdir}"/libmeegotouch-${pkgver}/mgen
  make INSTALL_ROOT="${pkgdir}" install
  cd ../mmoc
  make INSTALL_ROOT="${pkgdir}" install
}
