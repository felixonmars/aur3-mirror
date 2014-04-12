#Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python-future-old
pkgver=0.9.0
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2. Older version packaged as a python-mezzanine dependency."
url="https://github.com/PythonCharmers/python-future"
depends=('python')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/f/future/future-${pkgver}.tar.gz")
md5sums=('6d5af6b5e85faad86404e0cfc1abdb26')
conflicts=('python-future')
provides=('python-future')

build() {
    cd $srcdir/future-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/future-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
