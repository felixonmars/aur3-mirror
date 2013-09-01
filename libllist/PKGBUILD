#Maintainer theNerd247 <noah.harvey247@gmail.com>

pkgname=libllist
pkgver=0.0.3
pkgrel=2
pkgdesc="A C library for linked lists"
arch=('i686' 'x86_64')
url=https://www.github.com/theNerd247/libllist
license=('GPL')
depends=('glibc')
source=("$url/raw/master/pkgs/$pkgname-$pkgver.tar.gz"
				"$url/raw/master/patches/llappend.patch")

md5sums=('b636039f89fbf94959877cf9d6aba004'
				 'ccbef66d2a51797f9b559d5e43cf1c49')  

prepare()
{
	cd "$srcdir"
	patch $pkgname-$pkgver/src/llist.c llappend.patch
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
