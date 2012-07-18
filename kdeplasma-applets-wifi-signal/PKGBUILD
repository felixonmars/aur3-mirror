# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-wifi-signal
pkgver=0.5
pkgrel=1
pkgdesc="KDE plasma applet which displays the signal strength of the access point your wifi NIC is currently connected to."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Plasma+WiFi?content=79476"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-wifi-signal')
replaces=('plasmoid-wifi-signal')
source=("http://kde-look.org/CONTENT/content-files/79476-plasma-wifi-$pkgver.tgz"
	'plasma.patch')
md5sums=('21c66f4ff5145ad2ebc0ad9ea930081f'
	 'd074c8cc5164d923c4ecdcc592addfc5')

build() {
  # Fix build
  cd plasma-wifi-${pkgver}
  patch -Np1 -i "${srcdir}"/plasma.patch
  cd ..
  
  mkdir build
  cd build
  cmake ../plasma-wifi-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}