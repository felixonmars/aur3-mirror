# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=sessionk-git
pkgver=20140214
pkgrel=1
pkgdesc="A fast ksmserver/startkde replacement."
url="https://dantti.wordpress.com/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('xorg-iceauth' 'kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
install=${pkgname}.install
source=('git://anongit.kde.org/scratch/dantti/sessionk')
md5sums=('SKIP')

build() {
  cd ${srcdir}/sessionk

  mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ../sessionk

  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=$pkgdir install
}