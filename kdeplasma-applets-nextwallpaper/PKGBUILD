# Contributor: Ajsin Roman <aysin.roman@gmail.com>

pkgname=kdeplasma-applets-nextwallpaper
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple applet that changes the current wallpaper (when in slideshow mode) on command."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Next+wallpaper?content=94251"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-nextwallpaper-plasmoid')
replaces=('plasma-nextwallpaper-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/94251-nextwallpaper-cpp.tar.gz")
md5sums=('28fa75eaf8cd17a220528252b9781124')

build() {
  mkdir build
  cd build
  cmake ../nextwallpaper \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}