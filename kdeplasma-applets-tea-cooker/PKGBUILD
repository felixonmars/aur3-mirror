# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-tea-cooker
pkgver=0.3.0
pkgrel=1
pkgdesc="KDE 4 Plasma applet to assist all lovers of tea in the task of steeping tea for just the perfect length of time"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Tea+Cooker?content=85564"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-tea-cooker')
replaces=('plasmoid-tea-cooker')
source=("http://kde-look.org/CONTENT/content-files/85564-TeaCooker.tar.gz"
        'plasma.patch')
md5sums=('3a58895b0927bf0b55b165968c71cbc1'
         '71fb4655b51e8471a446000fbcb7dddc')

build() {
  # Fix build
  cd TeaCooker
  patch -Np1 -i "${srcdir}"/plasma.patch
  cd ..

  mkdir build
  cd build
  cmake ../TeaCooker \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}