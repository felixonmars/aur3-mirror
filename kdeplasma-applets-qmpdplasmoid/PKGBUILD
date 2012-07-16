# Contributor: Stevek - stevekej@gmail.com

pkgname=kdeplasma-applets-qmpdplasmoid
pkgver=0.0.8
pkgrel=1
pkgdesc="A small mpd client plasmoid for KDE4"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/qmpdplasmoid?content=140412"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-addons-applets-qmpdplasmoid')
replaces=('kdeplasma-addons-applets-qmpdplasmoid')
source=("http://kde-look.org/CONTENT/content-files/140412-qmpdplasmoid-$pkgver.tar.gz")
md5sums=('8a8b7898b3be3c3b812e1cfac4590e21')

build() {
  mkdir build
  cd build
  cmake ../qmpdplasmoid-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}