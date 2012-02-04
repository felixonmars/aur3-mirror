# Contributor: T-T

pkgname='t-t_mpz'
pkgver='1.5'
pkgrel=0
pkgdesc="Simple mpd statusbar"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mpz/files/"
license=('BSD')
depends=(bash mpc zenity)
makedepends=()
conflicts=()
optdepends=()

source=("https://downloads.sourceforge.net/project/mpz/mpz-$pkgver")
md5sums=(032b427287be7a586fba050d10ef5e8c)

build() {
	cd $srcdir/
	
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	
	mv `readlink $srcdir/mpz-$pkgver` $pkgdir/usr/bin/mpz
	chmod +x $pkgdir/usr/bin/mpz
}
