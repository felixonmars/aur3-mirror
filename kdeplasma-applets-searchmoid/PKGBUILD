# Contributor: Jason Scurtu <jscurtu@gmail.com>

pkgname=kdeplasma-applets-searchmoid
pkgver=0.1
pkgrel=1
pkgdesc="Simple Internet Quick Search bar (with history) for the following websites : Google, yahoo, Wikipedia etc "
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/SearchMoid?content=99460"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('searchmoid-plasmoid')
replaces=('searchmoid-plasmoid-kdemod' 'searchmoid-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/99460-SearchMoid01.tar.gz")
md5sums=('cd305ef897c07a213f57d4050c9c2d57')

build() {
  mkdir build
  cd build
  cmake ../SearchMoid \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}