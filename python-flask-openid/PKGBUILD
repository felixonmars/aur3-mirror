pkgname=python-flask-openid
_pkgname=Flask-OpenID
pkgver=1.2.1
pkgrel=1
pkgdesc='A Flask extension for using OpenID authentication (python3 version)'
arch=('i686', 'x86_64')
url="http://github.com/mitsuhiko/flask-openid/"
license=('BSD')
depends=('python-openid' 'python-flask')
source=("https://pypi.python.org/packages/source/F/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('8044847ca72003da3d3e41a677341b4f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
