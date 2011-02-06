pkgname=acpi-support-debian
pkgver=0.109
pkgrel=2
debrel=11
debname=${pkgname/-debian/}
pkgdesc="Debian's original ACPI Support Package (Ubuntu removed support for severl laptops in favor of their kernel)"  
depends=('acpid')
makedepends=('make')
provides=('acpi-support' 'acpi_fakekey')
conflicts=('acpi_fakekey' 'acpi-support')
url="http://packages.debian.org/acpi-support"
deblocation='http://mirror.isoc.org.il/pub/debian/pool/main/a'
source=("$deblocation/$debname/$debname-base_$pkgver-${debrel}_all.deb" acpi-support)
md5sums=('22b1b206b7ae9357b3f66f662d061e57' '6e58ece63e8298dc58cac05be0de2a0e')

if [ "$CARCH" = "i686" ]; then
	source[2]="$deblocation/$debname/${debname}_$pkgver-${debrel}_i386.deb"
	md5sums[2]='b143df9f66a82dcc3b5dd4c703402cd0'
fi

if [ "$CARCH" = "x86_64" ]; then
	source[2]="$deblocation/$debname/${debname}_$pkgver-${debrel}_amd64.deb"
	md5sums[2]='cc82c4d194aef6028b0eade9ef87d1bd'
fi

arch=('i686' 'x86_64')
license="GPL"
install=($pkgname.install)

build() {
	local ROOT=../pkg
	ar x `basename ${source[2]}`
	tar xf data.tar.gz -C $ROOT
	ar x `basename ${source[0]}`
	tar xf data.tar.gz -C $ROOT
	rm -r $ROOT/etc/init.d
	mkdir -p $ROOT/etc/rc.d
	cp acpi-support $ROOT/etc/rc.d
}

