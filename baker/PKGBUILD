pkgname=baker
pkgver=1.02
pkgrel=2
pkgdesc="Easy, powerful access to Python functions from the command line"
arch=(any)
url="http://pypi.python.org/pypi/Baker/1.02"
license=('Apache License 2.0')
depends=('python2')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/B/Baker/Baker-$pkgver.tar.gz)

build() {
    cd $startdir/src/Baker-$pkgver
    python2 setup.py install --root=$startdir/pkg
}
md5sums=('45fa7d3d83831d14021132ffd0fc553a')

