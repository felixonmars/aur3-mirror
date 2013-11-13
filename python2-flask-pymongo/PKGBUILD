pkgname=python2-flask-pymongo
_pkgname=Flask-PyMongo
pkgver=0.3.0
pkgrel=1
pkgdesc='PyMongo support for Flask applications'
arch=('i686', 'x86_64')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('BSD')
depends=('python2-pymongo' 'python2-flask')
source=("https://pypi.python.org/packages/source/F/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('594fcb7df267f8312aa5243118fe3886')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py install --root=${pkgdir} --optimize=1
}
