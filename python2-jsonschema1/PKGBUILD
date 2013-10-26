# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=jsonschema
pkgname=python2-${_pkgname}1
pkgver=2.2.0
pkgrel=1
pkgdesc="Python object model built on JSON schema and JSON patch"
arch=(any)
url=https://github.com/Julian/jsonschema
license=(MIT)
makedepends=(python2-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/Julian/jsonschema/archive/v$pkgver.tar.gz)
sha256sums=('a95f916f1eeee8291802bef830c2e462621b0603a14b9e6579535a97222bdc88')
sha512sums=('7608d9f071533ec1d501e1ffa2df2a131f457ff6539d624b1715601feebc0fc7c21df6c2902c347d63290dbf76ef79147dbe2f7a886d8aedbe9b291dc07382ff')

build() {
    cd $_pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $_pkgname-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}
