# Contributor: vogo <vogo@seznam.cz>

pkgname=kdeplasma-applets-battery-ng
pkgver=trunk
pkgrel=1
pkgdesc="This is a modification of the original battery plasmoid of plasma desktop. It allows interpolation between battery states which effectivly provides a continuous bar instead of only 6 fill states."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=117820"
license=('GPL2')
groups=()
depends=('kdebase-workspace>=4.3')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://kde-look.org/CONTENT/content-files/117820-battery-ng.tbz")
noextract=()
md5sums=('dfca88d30b4c22d0c82e140cf6ccc015')

build() {
  cd $srcdir/battery-ng
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

