# Contributor: Nate Rhodes  <nate.rhodes at gmail.com>
# Created:     January 2008

pkgname=cycfx2prog
pkgver=0.41
pkgrel=1
pkgdesc="A small tool to program the FX2 and do basic endpoint communication for testing."
arch=('i686')
url="http://www.cip.physik.uni-muenchen.de/~wwieser/elec/periph/USB-FX2/software/"
license=('GPL')
depends=('libusb')
source=("http://www.cip.physik.uni-muenchen.de/~wwieser/elec/periph/USB-FX2/software/$pkgname-$pkgver.tar.gz")
md5sums=('618207b113ed364a7a09c16ae881b945')

build() {
  # Go to source dir
  cd "$startdir/src/$pkgname-$pkgver"

  # Build the binaries
  make || return 1

  # Move binaries around to proper place
  install -D "$startdir/src/$pkgname-$pkgver/$pkgname" "$startdir/pkg/usr/bin/$pkgname" || return 1
}

