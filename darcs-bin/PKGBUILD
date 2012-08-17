# Maintainer: Gerardo Marset <gammer1994@gmail.com>

pkgname=darcs-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="A distributed revision control system. Binary version."
arch=('i686' 'x86_64')
url="http://darcs.net/"
license=('GPL')
provides=('darcs')
conflicts=('darcs')
source=(http://teratorn.org/code/darcs-$pkgver-linux-ghc7.0.4-CURL-packed.by.ermine.tar.bz2)
md5sums=('4742e7e13f6506325e463dffb4beaa59')
options=(!strip)

build() {
    install -Dm755 darcs $pkgdir/usr/bin/darcs
}
