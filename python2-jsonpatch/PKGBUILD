# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-jsonpatch
pkgver=1.1
pkgrel=1
pkgdesc="Python object model built on JSON schema and JSON patch"
arch=(any)
url=https://github.com/stefankoegl/python-json-patch
license=(BSD)
depends=(python2-jsonschema1)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/j/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('0a5e453fa7ec05e838fc66301708115e59fc9866a1bb46ed08da33c7d0ba2e14')
sha512sums=('7b0ff134bef4a6004f6d845e14abb81a4bd8bbd34741594d772ddcbb0af2977abefdb7fa2fb4e2d6a94e0539319bc71039d149b218fa8c9ae2ed9a1e2363fbeb')

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}
