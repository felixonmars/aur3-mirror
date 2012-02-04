# -*- shell-script -*-

python=python2
name=shpaml

pkgname=$python-$name
pkgver=1.00b
pkgrel=2
pkgdesc="Light syntax layer for HTML"
arch=(any)
url='http://shpaml.webfactional.com/'
license=(MIT)
depends=($python)
makedepends=($python)
source=(shpaml.py::http://shpaml.webfactional.com/shpaml_py
    setup.py
    shpaml.py.diff)

build() {
    mkdir -p $srcdir/$name-$pkgver
    cd $srcdir/$name-$pkgver
    cp ../shpaml.py ./
    patch -p0 <../shpaml.py.diff
    cp ../setup.py ./
    $python setup.py install --prefix=/usr --root=$pkgdir
}
md5sums=('1e785ceefd066c3c9d0674e0486f9ee8'
         '7f6c7f869629f09d0f16d88a338b39ad'
         'adfe84e55bf490ec6415e4e3cfc1004e')
