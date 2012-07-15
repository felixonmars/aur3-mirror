# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-flickr-on-plasma
pkgver=0.7.1
pkgrel=1
pkgdesc="A kdeplasma applet showing interesting pictures on Flickr"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=94800"
license=('GPL')
depends=('kdebase-workspace')
optdepends=('kdeedu-marble')
makedepends=('cmake' 'automoc4')
conflicts=('flickr-on-plasma-plasmoid')
replaces=('flickr-on-plasma-plasmoid')
source=("http://www.bramschoenmakers.nl/files/flickrop-$pkgver.tar.bz2")
md5sums=('b0ced248f59d35cdd8c3c0d913cf4ced')

build() {
  mkdir build
  cd build
  cmake ../flickrop-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
