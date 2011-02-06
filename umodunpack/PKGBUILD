# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=umodunpack
pkgver=1.11
pkgrel=2
pkgdesc="A small script for extracting files from Unreal Tournament Umod intallers."
arch=(any)
url="http://www.deepsky.com/~misaka/"
license=('custom')
depends=(perl)
source=(http://www.deepsky.com/~misaka/scripts/umodunpack.pl)
md5sums=('012d50a50c62165f9537fd8027381ffc')

build() {
    install --mode=0755 -D -- "$srcdir/umodunpack.pl" \
            "$pkgdir/usr/bin/umodunpack"
}

