# Contributor: Patrick Schwalm <patrick.schwalm@gmx.de>

pkgname=kdeplasma-applets-rtm-google
pkgver=1.0.0
pkgrel=1
pkgdesc="This plasmoid integrates the google todo list in your plasma desktop"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Remember+The+Milk+Google+Gadget+Plasmoid?content=101426&PHPSESSID=4d49a80271871f1c4dede72ca6c36dac"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('rtm-google-plasmoid')
replaces=('rtm-google-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/101426-plasma-widget-remeberthemilk.tar.gz")
md5sums=('22af9ccd14b8578addbf227b98ca5138')
         
build(){
  mkdir build
  cd build
  cmake ../plasma-widget-remeberthemilk-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
