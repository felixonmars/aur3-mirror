# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-cloudfiles
pkgver=1.7.11
pkgrel=1
pkgdesc="Python language bindings for Cloud Files API"
arch=('i686' 'x86_64')
url="http://www.rackspacecloud.com/"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')

source=("https://github.com/rackerlabs/python-cloudfiles/archive/1.7.11.tar.gz")
md5sums=('5bb7975213be67c1de8e19aa53b78f03')

build() {
  cd "$srcdir/${pkgname//2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname//2}-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
