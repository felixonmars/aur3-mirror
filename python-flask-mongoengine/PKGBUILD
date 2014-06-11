pkgname=python-flask-mongoengine
_pkgname=flask-mongoengine
pkgver=0.7.0
pkgrel=1
pkgdesc='A Flask extension that provides integration with MongoEngine (python3 version)'
arch=('i686', 'x86_64')
url="https://github.com/mongoengine/flask-mongoengine"
license=('Other')
depends=('python-mongoengine-git' 'python-flask')
source=("https://pypi.python.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9219a08bb4ca7503904bb941084fee52')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
