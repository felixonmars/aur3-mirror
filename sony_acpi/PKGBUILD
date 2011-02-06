pkgname=sony_acpi
pkgver=1
pkgrel=2
pkgdesc="The sonypi driver enables access to the Sony Programmable I/O Control Device which can be found in many Sony Vaio laptops."
url="http://popies.net/sonypi/"
license="GPL"
depends=()
makedepends=('kernel26-headers')
conflicts=()
replaces=()
backup=()
install=sonypi.install
source=(http://popies.net/sonypi/$pkgname.tar.gz)
md5sums=('1f961355512fc7d96dfc559f53c69980')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  mkdir -p $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/acpi
  cp $pkgname.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/acpi/
}
