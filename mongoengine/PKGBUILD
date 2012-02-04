# Contributor: Andrei Antoukh - niwi@niwi.be

pkgname=mongoengine
pkgver=0.5
pkgrel=1
pkgdesc="A Python Object-Document-Mapper for working with MongoDB"
arch=(any)
url="http://hmarr.com/mongoengine/"
license=('MIT')
depends=('python2')
makedepends=('setuptools')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/m/mongoengine/mongoengine-$pkgver.tar.gz)
md5sums=('11b1dca4fef863e745e7e80f5f55a372')

build() {
    cd "$srcdir/mongoengine-$pkgver"
    python2 setup.py install --root=$pkgdir/ || return 1
}
