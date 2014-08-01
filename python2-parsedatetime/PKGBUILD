# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=python2-parsedatetime
pkgver=1.4
pkgrel=1
pkgdesc="Parse human-readable date/time text"
arch=(any)
url=http://github.com/bear/parsedatetime/
license=(Apache)
depends=(python2)
makedepends=(python2-setuptools)
source=(https://pypi.python.org/packages/source/p/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('09bfcd8f3c239c75e77b3ff05d782ab2c1aed0892f250ce2adf948d4308fe9dc')
sha512sums=('bb4bd32e07abacb3f0b8bf71a8c72ced5a6294d881598479706ef6390f924ad12c771d33404ba1f166c71ba623feb7341a52396a1f39b1ee3eff5a2b471694d1')

prepare() {
    find ${pkgname#*-}-$pkgver -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}
