pkgname=python-flask-oauthlib
_pkgname=Flask-OAuthlib
pkgver=0.5.0
pkgrel=1
pkgdesc='A Flask extensionthat allows you to interact with remote OAuth enabled applications. (python3 version)'
arch=('i686', 'x86_64')
url="https://github.com/lepture/flask-oauthlib"
license=('BSD')
depends=('python-oauthlib' 'python-flask')
source=("https://pypi.python.org/packages/source/F/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5598fb1043b91daace853e8820c019b2')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
