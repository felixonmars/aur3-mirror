# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=python-sqlparse
_modname=${pkgname#*-}
pkgver=0.1.11
pkgrel=1
pkgdesc="Non-validating SQL parser for Python"
arch=(any)
url=https://github.com/andialbrecht/sqlparse
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
source=(http://pypi.python.org/packages/source/s/$_modname/$_modname-$pkgver.tar.gz
    https://raw.github.com/andialbrecht/sqlparse/master/COPYING)
sha256sums=('4355f38d0fd620a6f2c45a9cfe822988a379d3d097bb47bf009e9eb5b323ed1e'
            '2d653b2ccbd6bfe4a7520845eab73826fc57eb3c25d845623f0a4ca2a31cef06')
sha512sums=('f9ff42251dae52af2fb864dbe67b47814f7b22d91ac8bf37bad2f4d14af6b2776f9ce8f6f57f16403334f31676086f7e5367384dd0ef2ab754212edb1b635c10'
            'f9f3d00d8c3b77a93e25513cd51dae150ecd5404fddbba3b4fc4a86db44b843fb0e1e01df1e8b8acf5daf6fbf2cbb01ece6bf1807acdd3926cff73f10c66abe2')

build() {
    cd $_modname-$pkgver/
    python setup.py build
}

package() {
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
    cd $_modname-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
