pkgname=p54pci-firmware
pkgver=1.0
pkgrel=1
pkgdesc="firmware for p54pci wlan devices"
url="http://prism54.org/newdrivers.html"
license="GPL"
arch=('i686')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://prism54.org/firmware/2.7.0.0.arm)
md5sums=('09f9da7ea757173c9de1a0322a1f9782')

build() {
  cd $startdir/src/$pkgname-$pkgver

  mkdir -p $startdir/pkg/lib/firmware
  cp 2.7.0.0.arm $startdir/pkg/lib/firmware/isl3886
}

