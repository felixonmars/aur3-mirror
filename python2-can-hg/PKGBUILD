# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=python2-can-hg
pkgrel=1
pkgver=r473.4baa9ebb48c1
pkgdesc="A python library for interfacing with the CAN bus"
arch=("any")
license=("GPL3")
url="https://github.com/adafruit/adafruit-beaglebone-io-python"
depends=("python2")
makedepends=("mercurial")

source=("$pkgname::hg+https://bitbucket.org/hardbyte/python-can")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root="${pkgdir}/" --prefix=/usr
}


