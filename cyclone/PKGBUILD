# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=cyclone
pkgver=0.1.3
pkgrel=1
pkgdesc="A music application for GNU/Linux that allows users to manipulate loops in various ways."
arch=('i686' 'x86_64')
url="http://toxic.cubicarea.it/cyclone"
license=('GPL')
depends=('qt4' 'jack' 'shared-mime-info')
# options=('!strip') # debug
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/cycloneloop/${pkgname}_$pkgver.tar.gz")
md5sums=('59244e06764d9a9424ae948dd6e087ed')

prepare() {
  cd $pkgname
  # right target path
  sed -i '/extra/d' Cyclone.pro
}

build() {
  cd $pkgname
  qmake-qt4 PREFIX=/usr 
#            QMAKE_CXXFLAGS+=" -g" # debug
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir/" install
}
