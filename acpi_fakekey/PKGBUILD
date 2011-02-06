pkgname=acpi_fakekey
_pkgsrcname=acpi-support
pkgver=0.136
pkgrel=1
pkgdesc="acpi_fakekey from ubuntu acpi-support which outputs the desired key code to /dev/input/event*"
url="http://packages.ubuntu.com/source/hardy/acpi-support"
source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/$_pkgsrcname/$_pkgsrcname"_"$pkgver.tar.gz)
md5sums=('295951a68e9dde9248bfa10e364db46e')
arch=('i686' 'x86_64')
license="GPL"

build() {
     cd $startdir/src/$_pkgsrcname-$pkgver
     make || return 1
     mkdir -p $startdir/pkg/usr/bin
     install -m 755 -D acpi_fakekey $startdir/pkg/usr/bin
}
