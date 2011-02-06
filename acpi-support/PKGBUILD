pkgname=acpi-support
pkgver=0.137
pkgrel=1
pkgdesc="Ubuntu Acpi Support Package"  
depends=('acpid' 'netkit-bsd-finger')
makedepends=('make')
provides=('acpi-support' 'acpi_fakekey')
conflicts=('acpi_fakekey')
url="http://packages.ubuntu.com/karmic/acpi-support"
source=
[ "$CARCH" = i686   ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"i386.deb acpi-support)
[ "$CARCH" = x86_64 ] && source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$pkgname/$pkgname"_"$pkgver"_"amd64.deb acpi-support)
md5sums=
[ "$CARCH" = i686   ] && md5sums=('75d12f03cd6f3997ab1e54b913bf16a2' '6e58ece63e8298dc58cac05be0de2a0e')
[ "$CARCH" = x86_64 ] && md5sums=('82aa3012de397bb30b3cab1fa9d46fbf' '6e58ece63e8298dc58cac05be0de2a0e')
arch=('i686' 'x86_64')
license="GPL"
install=($pkgname.install)
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
