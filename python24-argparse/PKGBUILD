# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

_pkgname=argparse
pkgname=python24-$_pkgname
pkgver=1.2.1
pkgrel=1
pkgdesc="Python command-line parsing library"
arch=('any')
url='http://code.google.com/p/argparse/'
license=('PSF')
depends=('python24')
makedepends=('python24-setuptools')
source=(http://argparse.googlecode.com/files/argparse-1.2.1.tar.gz)
sha256sums=('ddaf4b0a618335a32b6664d4ae038a1de8fbada3b25033f9021510ed2b3941a4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2.4 setup.py install --root="$pkgdir/" --optimize=1
}
