# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-wifi-signal
pkgver=0.5
pkgrel=1
pkgdesc="KDE 4 Plasma applet which displays the signal strength of the access point your wifi NIC is currently connected to."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Plasma+WiFi?content=79476"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/79476-plasma-wifi-$pkgver.tgz)
md5sums=('21c66f4ff5145ad2ebc0ad9ea930081f')

build() {
  cd $startdir/src/plasma-wifi-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}

