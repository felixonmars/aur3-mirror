pkgname=acpi_fakekey
_pkgname=acpi-support
pkgver=0.138
pkgrel=2
pkgdesc="acpi_fakekey from ubuntu acpi-support which outputs the desired key code to /dev/input/event*"
url="http://packages.ubuntu.com/acpi-support"
source=(http://nl.archive.ubuntu.com/ubuntu/pool/main/a/${_pkgname}/${_pkgname}"_"$pkgver.tar.gz)
md5sums=('df54775571cae9c9b550032070cc7dd0')
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
