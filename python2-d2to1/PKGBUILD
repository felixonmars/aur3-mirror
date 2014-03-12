# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-d2to1
pkgver=0.2.11
pkgrel=1
pkgdesc="Python bindings to the OpenStack Identity API (Keystone)"
arch=(any)
url=https://pypi.python.org/pypi/d2to1
license=(BSD)
depends=(python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/d/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('64097a1b9270458898a0047034e9ba422a6456f51771105f33edb6b38e19bfa8')
sha512sums=('46a8b8b154b77bbef7bfeeeba1d6752899fad1b4cac8a6df699d42c848dcccc51e16db6429d171efd829fd051215f58fd9a5ec2edb62a06cf75f00ec5faac4da')

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
