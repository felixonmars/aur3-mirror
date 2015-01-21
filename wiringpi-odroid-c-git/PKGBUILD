# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="wiringpi-odroid-c-git"
pkgver="20150120"
pkgrel="1"
pkgdesc="Arduino wiring-like library written in C for Hardkernel's ODROID C series."
url="https://github.com/synthead/wiringPi/tree/hardkernel_odroid_c"
arch=("armv7h" "i686" "x86_64")
license=("LGPL3")
makedepends=("git")
conflicts=("wiringpi-git")
provides=("wiringpi-git")
source=("git+https://github.com/synthead/wiringPi.git#branch=hardkernel_odroid_c")
md5sums=("SKIP")

build() {
  cd "$srcdir/wiringPi"
  make
}

package() {
  cd "$srcdir/wiringPi"
  make DESTDIR="$pkgdir" install
}
