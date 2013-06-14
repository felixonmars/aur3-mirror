# Maintainer: James Reed <supplantr at archlinux dot info>

pkgname=conconky
pkgver=13.VI.2013
pkgrel=1
pkgdesc='A very simple system monitor for GNU/Linux virtual consoles.'
arch=('i686' 'x86_64')
url='http://conconky.nanohertz.net'
license=('GPL3')
depends=('glibc')
source=('http://conconky.nanohertz.net/conconky.tar.gz')
md5sums=('536aba531a2d9a5ea86f3d200c955a2f')

build() {
    cd "$srcdir"
    make
}

package() {
    cd "$srcdir"
    install -Dm755 conconky "$pkgdir/usr/bin/conconky"
}
