# Maintainer: n8schicht (n8schicht at gmail dot com)

pkgname=starfield-wallpaper-plasmoid
pkgver=0.4
pkgrel=1
pkgdesc="This plasma wallpaper draws an animated starfield in the background of your desktop."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Star+Field+Plasma+Wallpaper?content=105973"
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/105973-starfield-wallpaper-$pkgver.tar.gz)
license=('GPL')
md5sums=('c5384a66492b9d5ee00928fd0ba0ca40')

build() {
  cd $srcdir/starfield-wallpaper-0.4
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../src/ || return 1
  make VERBOSE=1 || return 1
  make DESTDIR=$pkgdir install || return 1
}
