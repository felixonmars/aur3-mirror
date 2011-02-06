# Maintainer: Andreas Zwinkau <beza1e1@web.de>

pkgname=python-selector
pkgver=0.8.11
pkgrel=1
pkgdesc="mapping of URL paths to WSGI applications"
arch=('i686')
url="http://lukearno.com/projects/selector/"
license=('GPL')
depends=('python' 'python-resolver')
makedepends=('python' 'setuptools')
source=("http://pypi.python.org/packages/source/s/selector/selector-0.8.11.tar.gz")
md5sums=('c9b14feef5a6e09421516d1cf764498c')

build() {
  cd $startdir/src/selector-${pkgver}
  python setup.py install --root=$startdir/pkg
}

