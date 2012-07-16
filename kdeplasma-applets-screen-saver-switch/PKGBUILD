# Contributor: IgooR <igoor (at) godsgift (dot) de>

pkgname=kdeplasma-applets-screen-saver-switch
pkgver=0.2
pkgrel=1
pkgdesc="Lets you quickly enable or disable the screen saver autostart by clicking on the icon"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=93752"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('screen-saver-switch-plasmoid')
replaces=('screen-saver-switch-plasmoid')
source=("http://www.kde-apps.org/CONTENT/content-files/93752-plasma-applet-screensaverswitch-$pkgver.tar.gz")
md5sums=('633b89423c6b9a8bb4f6b55756f9d71c')

build() {
  mkdir build
  cd build
  cmake ../plasma-applet-screensaverswitch-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}