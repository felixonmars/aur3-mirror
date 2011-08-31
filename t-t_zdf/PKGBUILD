# Contributor: T-T

pkgname='t-t_zdf'
pkgver='1.0'
pkgrel=0
pkgdesc="Shows full devices"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/zdf/files/"
license=('BSD')
depends=(bash coreutils zenity)
makedepends=()
conflicts=()
optdepends=()

source=("https://downloads.sourceforge.net/project/zdf/zdf-$pkgver")
md5sums=('8090e3b6deff6585a78fa767afdaf1fd')

build() {
	cd $srcdir/
	
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	
	mv $srcdir/zdf-$pkgver $pkgdir/usr/bin/zdf
	chmod +x $pkgdir/usr/bin/zdf
}
