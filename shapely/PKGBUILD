# Contributor: Joseph Xu <josephzxu@gmail.com>
pkgname=shapely
pkgver=1.2.18
pkgrel=1
pkgdesc="A package for creation, manipulation, and analysis of planar geometries"
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/Shapely'
license=('BSD')
depends=('python2>=2.5' 'geos>=3.1')
makedepends=('gcc' 'python2-distribute')
source=("shapely.tar.gz::https://github.com/sgillies/shapely/archive/${pkgver}.tar.gz")
md5sums=("34d9b375671b9de3339c189d414e296d")

_dir=shapely-${pkgver}

build() {
    cd "$srcdir/${_dir}"

    python2 setup.py build
}

package() {
    cd "$srcdir/${_dir}"

    python2 setup.py install --skip-build --root=$pkgdir

    mkdir -p $pkgdir/usr/share/licenses/shapely
    cp LICENSE.txt $pkgdir/usr/share/licenses/shapely/LICENSE

    # don't want to install these demos
    rm -rf $pkgdir/usr/bin
}
