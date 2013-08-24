# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=python2-zanshin
pkgver=0.6
pkgrel=4
pkgdesc="A library for collaboration over HTTP, WebDAV, and CalDAV"
arch=(any)
url=http://chandlerproject.org/Projects/ZanshinProject
license=(MIT)
depends=(icu python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/z/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('728b4a67f852894877cdbce3949c2b9ccee20e520f7ef93cd976726071c1c84f')
sha512sums=('26b47b1dc45df21af6535980df98a639b5a353c0a083e3610f6aecec2e6113cc0b21e2a1b7a527d587117f4c0c1831520019d1522ecea919198dc1947cd022ba')

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
