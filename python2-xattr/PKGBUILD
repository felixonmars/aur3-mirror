# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-xattr
pkgver=0.7.5
pkgrel=1
pkgdesc="Module for manipulating filesystem extended attributes"
arch=(any)
url=https://pypi.python.org/pypi/xattr/
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/x/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('32ceae0a55e8a2f5de35f085397aaaf55ae80dc127fd8613f76d3945ff4bf2b9')
sha512sums=('d68cd4d293c975e6857c46b95ab00b488c1e8525a69e8113a02c22996c7f345abe0ead63d9f40ce5610a3b5742b3b4e1aa7ec36ad25741c915e1df1ad9591cc2')

prepare() {
    sed -ri 's:^#!/usr/bin/(env )?python$:&2:' ${pkgname#*-}-$pkgver/${pkgname#*-}/tool.py
}

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
