# Contributor: Harry Marr <harry.marr@gmail.com>

pkgname=python-mongoengine
pkgver=0.3
pkgrel=1
pkgdesc="A Python Object-Document-Mapper for working with MongoDB"
arch=(any)
url="http://hmarr.com/mongoengine/"
license=('MIT')
depends=('python')
makedepends=('setuptools')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/m/mongoengine/mongoengine-$pkgver.tar.gz)
md5sums=('c31b42b2170347ec153098d538216ee1')

build() {
    cd "$srcdir/mongoengine-$pkgver"
    python setup.py install --root=$pkgdir/ || return 1
}
