# Maintainer: Marcelo Cavalcante - aka kalib <kalib@archlinux-br.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tuxnes
pkgver=0.75
pkgrel=2
pkgdesc="TuxNES is based on Nestra, a great public-domain NES emulator"
arch=("i686")
url="http://tuxnes.sourceforge.net/"
license=()
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5db0cd42dfdff3e681805e93b4867c43')

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
