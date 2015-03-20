# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=python2-extras
_pkgname=${pkgname#*-}
pkgver=0.0.3
pkgrel=1
pkgdesc="Useful extra bits for Python"
arch=('any')
makedepends=('setuptools')
depends=('python2')
url="https://github.com/testing-cabal/extras"
license=('MIT')
source=(http://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('62d8ba049e3386a6df69b413ea81517b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python2 setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
