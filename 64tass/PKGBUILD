# Contributor: lobotomius at gmail dot com

pkgname=64tass
pkgver=1.46
pkgrel=1
pkgdesc="c64's tasm source compatible assembler"
arch=('any')
url="http://singularcrew.hu/64tass/"
license=('GPL')
source=('ftp://c64.rulez.org/pub/c64/IDE64/source/64tass_v1.46.tar.bz2')
md5sums=('6dc1f52bc08cda8a1c5838d2a524e334')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    mkdir -p ${pkgdir}/usr/bin
    cp 64tass ${pkgdir}/usr/bin
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 64tass "$pkgdir/usr/bin"

}