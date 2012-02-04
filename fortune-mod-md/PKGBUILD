# Contributor: Marco 'quizzlo' Paolone <marcopaolone@gmail.com>

pkgname=fortune-mod-md
pkgver=20110609
pkgrel=1
pkgdesc="Fortune cookie collection by Marco 'md' d'Itri"
arch=('any')
url="http://www.linux.it/~md"
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.linux.it/pub/People/md/md-fortunes.gz)
md5sums=('fd0732e05f4c691b4aa8b8de2f01aea9')

build() {
    # This package is distributed under Beerware license.
    # http://en.wikipedia.org/wiki/Beerware

    sed -i 1,6d md-fortunes
    mkdir -p $startdir/pkg/usr/share/fortune
    mv md-fortunes md
    strfile md
    cp -v md md.dat $startdir/pkg/usr/share/fortune
}
