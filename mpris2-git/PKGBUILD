# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=mpris2-git
pkgver=0.9.23.1508d08
pkgrel=1
pkgdesc="Python usable definiton of MPRIS2"
arch=(any)
url=https://github.com/hugosenari/${pkgname%-*}
license=('GPL')
depends=(pydbusdecorator-git)
makedepends=(git)
source=($pkgname::git://github.com/hugosenari/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(grep -o "version='[0-9.]\+" setup.py | tr -d "a-z='").$(git shortlog | grep -c '\s\+').$(git describe --always)
}

prepare() {
    find $pkgname/ -name '*.py' -exec sed -i 's:^#!/usr/bin/python$:&2:' '{}' \;
}

build() {
    cd $pkgname/
    python2 setup.py build
}

package() {
    cd $pkgname/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
