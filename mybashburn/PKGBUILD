# Contributor: Jeff Bailes <thepizzaking@gmail.com>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=mybashburn
pkgver=1.0.2
pkgrel=3
pkgdesc="Bash Burn with ncurses interface"
arch=('i686' 'x86_64')
url="http://mybashburn.sourceforge.net/"
license=('GPL')
depends=('dialog' 'coreutils' 'cdrdao' 'cdrkit')
install=mybashburn.install
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2" "patch")
md5sums=('6bcf860ed5e9317ca2447a9026a8e8f7'
         'baf838db9e109d740f74d48ed9c8f034')

build() {
	cd $srcdir/$pkgname-$pkgver
    
	patch -Np0 -i $srcdir/patch

	make

	make DESTDIR=$pkgdir install

}
