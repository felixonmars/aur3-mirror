# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=pydbusdecorator-git
pkgver=1.0.33.fa3e38a
pkgrel=1
pkgdesc="Python decorator for dbus interfaces"
arch=(any)
url=https://github.com/hugosenari/${pkgname%-*}
license=(GPL)
depends=(python2)
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
