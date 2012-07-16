# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-server-status
pkgver=1.5.1
pkgrel=1
pkgdesc="Lets you monitor one or more servers via pings in a configurable interval"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=101336"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-server-status-plasmoid')
replaces=('plasma-server-status-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/101336-serverstatuswidget-1.5.1.tar.bz2")
md5sums=('2a33c714238edbbd9c4771b973b2d360')

build() {
  mkdir build
  cd build
  cmake ../serverstatuswidget-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}