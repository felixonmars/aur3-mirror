# Contributor: Andreas Schmidl <Andreas.Schmidl@gmail.com>

pkgname=kdeplasma-applets-drop2imageshack
pkgver=0.5.2
pkgrel=1
pkgdesc="A KDE plasma applet which can copy images to the imageshack web service. It copies the generated URL to clipboard"
arch=('i686' 'x86_64')
url="http://github.com/holycheater/plasma-widget-drop2imageshack"
license=('GPLv2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('drop2imageshack-plasmoid')
replaces=('drop2imageshack-plasmoid')
source=("http://cloud.github.com/downloads/holycheater/plasma-widget-drop2imageshack/plasma-widget-drop2imageshack_$pkgver.orig.tar.gz")
md5sums=('a00054f2378a5df2783d028717f317e4')

build() {
  mkdir build
  cd build
  cmake ../plasma-widget-drop2imageshack-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}