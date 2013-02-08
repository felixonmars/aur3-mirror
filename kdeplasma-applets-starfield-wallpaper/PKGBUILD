# Contributor: n8schicht (n8schicht at gmail dot com)
# Maintainer: Mark Coolen (mark dot coolen at gmail dot com)

pkgname=kdeplasma-applets-starfield-wallpaper
pkgver=0.4.2
pkgrel=1
pkgdesc="This plasma wallpaper draws an animated starfield in the background of your desktop."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Star+Field+Plasma+Wallpaper?content=105973"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('starfield-wallpaper-plasmoid')
replaces=('starfield-wallpaper-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/105973-starfield-wallpaper-$pkgver.tar.gz")
md5sums=('3259f93f55fb8ca18bec7cd348b8c243')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../starfield-wallpaper-$pkgver/src \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}