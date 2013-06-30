# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ibus-table-git
pkgver=1.6.0.442.c01120b
pkgrel=1
pkgdesc="The IM Engine framework for table-based input methods, such as ZhengMa, WuBi, ErBi, CangJie and so on."
arch=(any)
url=http://code.google.com/p/ibus/
license=(LGPL2.1)
depends=(python2-pyenchant ibus aspell-en)
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git://github.com/kaio/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(git describe --tags | sed 's/-/./g').$(git shortlog | grep -c '\s\+').$(git rev-parse --short HEAD)
}

build() {
    cd $pkgname/
    find -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
    ./autogen.sh PYTHON=/usr/bin/python2 --prefix=/usr --libexecdir=/usr/lib/ibus
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
