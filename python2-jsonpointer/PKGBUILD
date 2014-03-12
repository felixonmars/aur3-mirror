# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-jsonpointer
pkgver=1.2
pkgrel=1
pkgdesc="Identify specific nodes in a JSON document (RFC 6901)"
arch=(any)
url=https://github.com/stefankoegl/python-json-pointer
license=(BSD)
depends=(python2-d2to1 python2-oslo-config python2-pbr python2-prettytable python2-requests
    python2-setuptools_git python2-simplejson)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/j/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz
    https://raw.github.com/stefankoegl/python-json-pointer/master/COPYING)
sha256sums=('720858cc16a0ede921d63264f71f8542f68bc4e3be6a65404f9c5e176340c996'
    'd8b24f15d472885f788a2d6e985850f264627b86012a17bb242c83f310d907e5')
sha512sums=('385f39454095bf889a76729e4b72d3ff47a5d6a8a8af94bce4be428ec20ada14a2a4408b9df0a87967a3147641d491cca44ec1cbbb1a8571f2593304b8e9c521'
    '6a4c6b57a9cfe227175852c67ab7536fcc23646761cd10d25800edfccf408b139b1f589313f6cf6717c5764ca2e554cc16921118e01aebfbdf3ddfada82c6bac')

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
