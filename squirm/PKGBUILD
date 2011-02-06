# Maintainer: Spider.007 <archPackage@spider007.net>
# Contributor: Spider.007 <archPackage@spider007.net>
packager="Spider.007 <archPackage@spider007.net>"
pkgname=squirm
pkgver=1.26
pkgrel=1
pkgdesc="Squirm is a fast & configurable redirector for squid. This package includes an adzap2squirm script"
url="http://squirm.foote.com.au/"
groups=
provides=
depends=('squid')
source=("$url/$pkgname-$pkgver.tgz")
md5sums=('54ac1d208620ec1e4419f97315d38848')
license=('gpl')
arch=('i686')

build() {
	cd $startdir/src/$pkgname-$pkgver

	sed -i "s|USER=.*$|USER=proxy|g" Makefile
	sed -i "s|GROUP=.*$|GROUP=http|g" Makefile

	make PREFIX=/ || return 1
	make PREFIX=$startdir/pkg install
}
