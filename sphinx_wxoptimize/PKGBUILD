# Maintainer: Gour <gour@gour-nitai.com>
pkgname=sphinx_wxoptimize  
pkgver=1.2
pkgrel=2 
pkgdesc="Optimize sphinx generated htmlhelp files for wxWidgets rendering"
url="http://pypi.python.org/pypi/sphinx_wxoptimize/"
arch=('any')
license=('GPL2')
depends=('beautiful-soup>=3.0')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('03b67b28529b16d51f9fe7b621e63057')

build() {
    cd "$startdir/src/$pkgname-$pkgver"

    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
