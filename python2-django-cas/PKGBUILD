# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=python2-django-cas
_pkgname=django-cas
pkgver=2.1.0
pkgrel=1
pkgdesc="CAS (Central Authentication Service) middleware for Django"
arch=('any')
url="https://bitbucket.org/cpcc/django-cas/overview/"
license=('MIT')
depends=('python2')
source=("https://bitbucket.org/cpcc/${_pkgname}/get/${pkgver}.tar.gz")
md5sums=('6ac0e6e75bcff6577650b780b1e586ae')

build() {
    cd ${srcdir}/cpcc-${_pkgname}-5c6ebbeeab5d
    python2 setup.py build
}

package() {
    cd ${srcdir}/cpcc-${_pkgname}-5c6ebbeeab5d
    python2 setup.py install --root="$pkgdir" --optimize=1
}
