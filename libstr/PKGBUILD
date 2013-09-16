#Maintainer theNerd247 <noah.harvey247@gmail.com>

pkgname=libstr
pkgver=0.0.2
pkgrel=4
pkgdesc="An extension library for C standard string.h"
arch=('i686' 'x86_64')
url=https://www.github.com/theNerd247/libstr
license=('GPL')
source=("$url/raw/master/pkgs/$pkgname-$pkgver.tar.gz"
				"$url/raw/master/patches/strinsbuff.patch"
				"$url/raw/master/patches/strsub.patch")

depends=('glibc')
md5sums=('1d20b32f3ad3b2c8274dece1409157ea'
				 'cbdb39daa5c68c204651ae7e6fbeb376'
				 'e72bc8ec006ed64839534bcbc65d8753')

prepare()
{
	cd "$srcdir"	
	patch $pkgname-$pkgver/src/str.c strinsbuff.patch
	patch $pkgname-$pkgver/src/str.c strsub.patch
}

build()
{
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
