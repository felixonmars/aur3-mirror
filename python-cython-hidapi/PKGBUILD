# Maintainer: jyantis <yantis@yantis.net>

pkgname=python-cython-hidapi
pkgver=r52.8fac87b
_gitname=cython-hidapi
pkgrel=1
pkgdesc="A Cython interface to the HIDAPI from https://github.com/signal11/hidapi for Python 3"
arch=('i686' 'x86_64')
url='https://github.com/trezor/cython-hidapi'
license=('GPL')
depends=('python' 'libusb')
source=('git+https://github.com/trezor/cython-hidapi.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    git submodule init
    git submodule update
    python setup.py build
}

package() {
    cd ${_gitname}
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
