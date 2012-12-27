# Maintainer: Hector Mtz-Seara <hseara__*a*t*__gmail*.*com>

pkgname=python2-scientificpython
pkgver=2.9.2
pkgrel=2
pkgdesc="ScientificPython is a collection of Python modules for scientific computing. It contains support for geometry, mathematical functions, statistics, physical units, IO, visualization, and parallelization."
arch=('i686' 'x86_64')
url="https://bitbucket.org/khinsen/scientificpython/"
license=('custom:CeCILL')
depends=('python2-numpy' 'netcdf')
source=(https://bitbucket.org/khinsen/scientificpython/downloads/ScientificPython-2.9.2.tar.gz)
md5sums=('5fb53f29126316ae2628e74e629312d5')

build() {
  cd "$srcdir"/ScientificPython-$pkgver
  python2 setup.py build --numpy
}

package() {
    cd "$srcdir"/ScientificPython-$pkgver
    python2 setup.py install --prefix=/usr --root=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

