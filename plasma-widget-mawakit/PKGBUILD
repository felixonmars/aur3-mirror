# Contributor: Ahmed Atalla <a.atalla@linuxac.org>
pkgname=plasma-widget-mawakit
pkgver=0.2.0
pkgrel=1
pkgdesc="Mawakit is a prayer times plasmoid that plays the Islamic Adhan when it is time for prayer,Designed to be simple and elegant, Mawakit shows a countdown until the next prayer in a nice tooltip. "
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Mawakit?content=128606"
license=('GPL')
groups=()
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://git.ojuba.org/cgit/plasma-widget-mawakit/snapshot/plasma-widget-mawakit-$pkgver.tar.gz")
noextract=()
md5sums=('1da9f0ff1dadd3f6e8c204f68e8156ae')
build() {
  cd "$srcdir/plasma-widget-mawakit-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
 
