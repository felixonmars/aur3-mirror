# Contributer: Florian Richter <Florian_Richter@gmx.de>
pkgname=openmoko-toolchain
pkgver=20080916
pkgrel=1
pkgdesc="OpenMoko toolchain"
url="http://wiki.openmoko.org/wiki/Toolchain"
license=('GPL')
depends=()
arch=('i686' 'x86_64')
source=(http://downloads.openmoko.org/developer/toolchains/openmoko-$arch-$pkgver-arm-linux-gnueabi-toolchain.tar.bz2)
md5sums=('85b479850768a851847f33cee4584d79')

build() {
  cd $startdir
  mv src/usr pkg
}
