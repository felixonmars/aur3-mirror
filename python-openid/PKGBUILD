pkgname=python-openid
_pkgname=python3-openid
pkgver=3.0.5
pkgrel=1
pkgdesc='Python 3 port of the python-openid library'
arch=('i686' 'x86_64')
url="https://github.com/necaris/python3-openid"
license=('Apache')
depends=('python-oauthlib' 'python-flask')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2451572f60cbd346390f929cd4188afd')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
