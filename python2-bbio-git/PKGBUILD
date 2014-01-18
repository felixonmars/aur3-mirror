# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=python2-bbio-git
pkgver=r137.ff6f11a
pkgrel=2
pkgdesc="A set of Python tools to allow GPIO, PWM, and ADC access on the BeagleBone using the Linux 3.8 Kernel and above"
arch=("any")
license=("MIT")
url="https://github.com/adafruit/adafruit-beaglebone-io-python"
depends=("python2")
makedepends=("python2-distribute" "git")
provides=("python2-bbio")
conflicts=("python2-bbio")

source=("$pkgname::git+https://github.com/adafruit/adafruit-beaglebone-io-python.git/")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root="${pkgdir}/" --prefix=/usr
}
