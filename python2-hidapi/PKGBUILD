# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-hidapi
pkgver=0.7.99.5
pkgrel=1
pkgdesc="A Cython interface to the hidapi from signal11/hidapi"
arch=('i686' 'x86_64')
depends=('libsystemd' 'libusb' 'python2')
makedepends=('cython2' 'python2-setuptools')
url="https://github.com/trezor/cython-hidapi"
license=('unknown')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-0.7.99-5.tar.gz)
md5sums=('0cf30acc04a05c91470ba91ba3065641')
sha256sums=('9316c34c25a441e0c3f478a5a09a9e360e03d5bf5cf34e7f425419d3d3b6c8ac')

build() {
  cd "$srcdir/${pkgname#python2-}-0.7.99-5"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-0.7.99-5"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
