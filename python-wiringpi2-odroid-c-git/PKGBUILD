# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-wiringpi2-odroid-c-git"
pkgver="20150120"
pkgrel="1"
pkgdesc="Python-wrapped version of Gordon Henderson's WiringPI version 2.  Includes patches to support Hardkernel's ODROID C series."
url="https://github.com/synthead/WiringPi2-Python/tree/hardkernel_odroid_c"
arch=("x86_64" "i686" "armv7h")
license=("GPLv3")
depends=("python")
makedepends=("git" "python-setuptools")
conflicts=("python-wiringpi2" "python-wiringpi2-git")
provides=("python-wiringpi2" "python-wiringpi2-git")
source=("git+https://github.com/synthead/WiringPi2-Python.git#branch=hardkernel_odroid_c")
md5sums=("SKIP")

prepare() {
  cd "$srcdir/WiringPi2-Python"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/WiringPi2-Python"
  python setup.py build
}

package() {
  cd "$srcdir/WiringPi2-Python"
  python setup.py install --prefix="/usr" --root="$pkgdir"
}
