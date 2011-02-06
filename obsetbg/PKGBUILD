# Contributor: Joshua Kampmeier <unixpunx83@gmail.com>
pkgname=obsetbg
pkgver=0.1
pkgrel=2
pkgdesc="A simple wallpaper setter for OpenBox3 - based on fbsetbg."
source=(http://quiet.unixcorps.org/files/$pkgname/$pkgname-$pkgver.tar.bz2)
url="http://quiet.unixcorps.org"
md5sums=('0e139a3b296b6759c3c4030b001f92b2')
 
build() {
	cd $startdir/src/$pkgname-$pkgver
	install -D -m 755 ./obsetbg $startdir/pkg/usr/bin/obsetbg
	install -D -m 644 ./obsetbg.1.gz $startdir/pkg/usr/man/man1/obsetbg.1.gz 
}   
# vim: ft=sh ts=2 et
