# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=kdeplasma-applets-scripted-image-wallpaper
pkgver=0.3
pkgrel=1
pkgdesc="KDE 4 plasmoid to script wallpaper changes"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Scripted+Image+Wallpaper+Plugin?content=115147"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://kde-look.org/CONTENT/content-files/115147-scripted-image-wallpaper-plugin-${pkgver}.tar.gz")
md5sums=('a6101e931a41f54f49a348d78c71033d')


build() {
  mkdir build
  cd build
  cmake ../scripted-image-wallpaper-plugin-${pkgver}/src \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

