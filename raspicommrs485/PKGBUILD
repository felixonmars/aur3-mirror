# Maintainer: Martin, e-mail: mdk at amescon dot com
pkgname=raspicommrs485
pkgver=1.4
pkgrel=4
pkgdesc="raspicomm rs485 driver /dev/ttyRPC0"
buildarch=16 # ARMv6 only, as it's a raspberry pi extension
arch=('armv6h')
url="http://github.com/amescon/raspicomm-module-package-arch"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('raspicommrs485')
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://github.com/amescon/raspicomm-module/archive/v$pkgver.tar.gz")
noextract=()
sha256sum=() #autofill using updpkgsums

build() {
  # unpack the source and compile the kernel module
  tar -xf v$pkgver.tar.gz
  cd "$srcdir/raspicomm-module-$pkgver/"
  make -f Makefile_rpi
}

package() {
  cd "$srcdir/raspicomm-module-$pkgver"
  # install the kernel module
  install -D raspicommrs485.ko ${pkgdir}/lib/modules/$(uname -r)/${pkgname}.ko
}
md5sums=('a1ce78aabf54ff34910f51d6df552080')
