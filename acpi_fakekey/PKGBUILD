pkgname=acpi_fakekey
_pkgname=acpi-support
pkgver=0.140
pkgrel=1
pkgdesc="acpi_fakekey from ubuntu acpi-support which outputs the desired key code to /dev/input/event*"
url="http://packages.ubuntu.com/acpi-support"
source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/${_pkgname}/${_pkgname}"_"$pkgver.tar.gz)
md5sums=('02984210e33f1ccf408f86d5b7149013')
arch=('i686' 'x86_64')
license="GPL"

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -m755 -D acpi_fakekey "$pkgdir/usr/bin"
}
