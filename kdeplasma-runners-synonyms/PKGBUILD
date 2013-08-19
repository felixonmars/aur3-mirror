# Maintainer: Kristóf Szalay <krszalay@gmail.com>

pkgname=kdeplasma-runners-synonyms
pkgver=0.1
pkgrel=1
pkgdesc="A krunner plug-in that looks up synonyms using Google."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KRunner+Synonyms?content=157137"
license=('GPL2')
depends=('kdebase-workspace' 'qjson')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/157137-synonyms.zip")

build() {

  rm -rf build

  mkdir build

  cd build

  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
md5sums=('e694413252c09a06e52dfc061717c651') 
