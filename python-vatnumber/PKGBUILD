# Contributor: Gour <gour@gour-nitai.com>
pkgname=python-vatnumber
_pkgname=vatnumber
pkgver=0.5
pkgrel=1
pkgdesc="Python module to validate VAT numbers"
arch=('any')
url="http://code.google.com/p/vatnumber/"
license=('GPL3')
depends=('python')
makedepends=('setuptools')
source=("http://vatnumber.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
md5sums=('8923953f288fcca01e655298a85d91f3')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

