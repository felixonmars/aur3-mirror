# Maintainer: kelloco2@gmail.com
pkgname=toxlogged
pkgver=20140604
pkgrel=2
pkgdesc="Command execution to all X logged-in users"
url="http://github.com/kelloco2/toxlogged"
arch=('any')
license=('GPL')
makedepends=('git')
source=("git://github.com/kelloco2/toxlogged.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m755 "toxlogged" "$pkgdir/usr/bin/toxlogged"
}
