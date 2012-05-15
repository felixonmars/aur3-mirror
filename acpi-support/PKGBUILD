pkgname=acpi-support
pkgver=0.140
pkgrel=2
pkgdesc="Ubuntu ACPI support package"  
depends=('acpid' 'netkit-bsd-finger' 'dmidecode')
makedepends=('make')
provides=('acpi-support' 'acpi_fakekey')
conflicts=('acpi_fakekey')
url="http://packages.ubuntu.com/acpi-support"

[ "$CARCH" = i686   ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"i386.deb acpi-support)
[ "$CARCH" = x86_64 ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"amd64.deb acpi-support)
[ "$CARCH" = i686   ] && md5sums=('17212442578797919c6d973a159e42e5' '6e58ece63e8298dc58cac05be0de2a0e')
[ "$CARCH" = x86_64 ] && md5sums=('f898d4735a8ea74c12b6f7d4435a35b3' '6e58ece63e8298dc58cac05be0de2a0e')

arch=(i686 x86_64)
license="GPL"
install=$pkgname.install

package() {
  [ "$CARCH" = i686   ] && ar x $pkgname"_"$pkgver"_"i386.deb
  [ "$CARCH" = x86_64 ] && ar x $pkgname"_"$pkgver"_"amd64.deb

  tar xf data.tar.gz -C "$pkgdir"
  rm -rf "$pkgdir/etc/init.d"
  mv "$pkgdir/etc/default" "$pkgdir/etc/conf.d"
  sed -i 's|/etc/default|/etc/conf.d|' ${pkgdir}/etc/acpi/*.sh
  install -D -m755 "${srcdir}/acpi-support" "${pkgdir}/etc/rc.d/acpi-support"
}
