# Author: David Andersson <david@vs-hs.com>
pkgname=supload
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI uploader for Solidfiles.com" 
arch=(i686 x86_64)
url="http://solidfiles.com/" 
license="public domain" 
depends=('curl') 
source=(http://solidfiles.com/d/UUKa/get)
md5sums=('47ff9c7e976543ddaabdcc1d8e3eb766')

build() { 
	mkdir -p $pkgdir/usr/bin/
	cd $startdir/src/supload/
	make || return 1
	make install DESTDIR=$pkgdir
}

