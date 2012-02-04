# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-playwolf
pkgver=0.8.1
pkgrel=1
pkgdesc="A controller and visualizer plasmoid giving information about the songs for Amarok 2.0"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=93882"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://playwolf.googlecode.com/files/playwolf-$pkgver.tar.bz2")
md5sums=('28ec4f7abfcc367c0dae67f4d423d569')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../playwolf \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
