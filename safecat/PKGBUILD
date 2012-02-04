# Made by Mark <mark@caffeine-powered.net>.

pkgname=safecat
pkgver=1.13
pkgrel=4
pkgdesc="Safecat copies standard input safely to a specified directory."
arch=('i686' 'x86_64')
url="http://www.jeenyus.net/linux/software/safecat.html"
license=('GPLv2')
source=(http://www.jeenyus.net/linux/software/safecat/safecat-${pkgver}.tar.gz config.patch)
md5sums=('41f76b6c8c47f467556651855ea027a7'
         '644ab391a0588e077090fa86a75647da')

build() {
	cd $pkgname-$pkgver
	sed -i "s;TMPDIR_PKGBUILD;$pkgdir/usr;g" ../config.patch
	patch < ../config.patch
	make  || return 1
	make setup check || return 1
	#mkdir $pkgdir/usr
	#mv $pkgdir/safecat-tmp/* $pkgdir/usr
	#rmdir $pkgdir/safecat-tmp
}
