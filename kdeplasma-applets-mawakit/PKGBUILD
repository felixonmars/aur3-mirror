# Contributor: Ahmed Atalla <a.atalla@linuxac.org>

pkgname=kdeplasma-applets-mawakit
pkgver=0.3.0
pkgrel=1
pkgdesc="A prayer times plasmoid that plays the Islamic Adhan when it is time for prayer,Designed to be simple and elegant, Mawakit shows a countdown until the next prayer in a nice tooltip. "
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Mawakit?content=128606"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-widget-mawakit')
replaces=('plasma-widget-mawakit')
source=("http://git.ojuba.org/cgit/plasma-widget-mawakit/snapshot/plasma-widget-mawakit-$pkgver.tar.gz")
md5sums=('16627ecf86cae1902571512159110933')

build() {
  mkdir build
  cd build
  cmake ../plasma-widget-mawakit-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}