pkgname=acpi-support
pkgver=0.138
pkgrel=4
pkgdesc="Ubuntu ACPI support package"  
depends=('acpid' 'netkit-bsd-finger' 'dmidecode')
makedepends=('make')
provides=('acpi-support' 'acpi_fakekey')
conflicts=('acpi_fakekey')
url="http://packages.ubuntu.com/acpi-support"

[ "$CARCH" = i686   ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"i386.deb acpi-support)
[ "$CARCH" = x86_64 ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"amd64.deb acpi-support)
[ "$CARCH" = i686   ] && md5sums=('dac52504a2afd8a90fbbe954fcc2372f' '6e58ece63e8298dc58cac05be0de2a0e')
[ "$CARCH" = x86_64 ] && md5sums=('3917003ffe349f6d1e7ee5d6ebe2296b' '6e58ece63e8298dc58cac05be0de2a0e')

arch=('i686' 'x86_64')
license="GPL"
install=$pkgname.install

build() {
  local ROOT=../pkg

  [ "$CARCH" = i686   ] && ar x $pkgname"_"$pkgver"_"i386.deb
  [ "$CARCH" = x86_64 ] && ar x $pkgname"_"$pkgver"_"amd64.deb

  tar xf data.tar.gz -C $ROOT
  rm -r $ROOT/etc/init.d
  mkdir -p $ROOT/etc/rc.d
  cp acpi-support $ROOT/etc/rc.d
  chmod +x $ROOT/etc/rc.d/acpi-support
}
