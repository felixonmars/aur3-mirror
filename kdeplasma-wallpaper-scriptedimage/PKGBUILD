# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=kdeplasma-wallpaper-scriptedimage
pkgver=0.3
pkgrel=1
pkgdesc="a Plasma wallpaper plugin that lets you use scripts to control the wallpaper"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/?content=115147"
license=('GPL')
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=("http://kde-apps.org/CONTENT/content-files/115147-scripted-image-wallpaper-plugin-0.3.tar.gz")
sha1sums=('0f1a9b8f4272edfd5355edea65a2e244d2bb44f5')

build() {
  cd "$srcdir"

  rm -rf build
  mkdir build && cd build

  cmake "$srcdir"/scripted-image-wallpaper-plugin-0.3/src \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
