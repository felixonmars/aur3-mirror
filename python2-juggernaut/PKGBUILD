# Contributor: Veselin Vlasakiev <veselin at veselin dot org>

pkgname=python2-juggernaut
pkgver=0.2
pkgrel=1
pkgdesc="Python library that connects to a juggernaut via redis."
arch=(any)
url="http://pypi.python.org/pypi/juggernaut"
license=("BSD")
depends=("python2" "redis" "python2-redis")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/j/juggernaut/juggernaut-${pkgver}.tar.gz")
md5sums=('08ee4843bc9b7ecc97a459fc3408c63e')

build() {
    cd $srcdir/juggernaut-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
