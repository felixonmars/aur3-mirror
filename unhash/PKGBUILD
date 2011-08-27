# Maintainer: nozog <nozog@archlinux.us>

pkgname=unhash
pkgver=1.1
pkgrel=1
pkgdesc="UnHash is a program that tries a brute force attack against an MD5 or SHA1 hash."
arch=('i686' 'x86_64')
license=('GPL')
url="http://freshmeat.net/projects/unhash/"
depends=('openssl')
source=("http://www.dxp2532.info/tools/unhash-$pkgver.tar.bz2")
md5sums=('b0cce452ec2eb64c4e0a8ec1b04a32d5')

build() {
	cd ${srcdir}/unhash-$pkgver

	make || return 1
	
	mkdir $pkgdir/bin
	mv unhash $pkgdir/bin/unhash
}
