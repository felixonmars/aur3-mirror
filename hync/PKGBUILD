# Maintainer: Markus Pargmann <mpargman <AT> allfex.org>

pkgname=hync
pkgrel=2
pkgver=0.1.0
pkgdesc='hync is a small program to help synchronizing user home directories without a special server.'
arch=('any')
url='http://allfex.org'
license='GPL3'
depends=('openssh' 'rsync' 'python>=3.0.0')

source=(http://allfex.org/files/hync/${pkgver}/hync
	http://allfex.org/files/hync/${pkgver}/sample.conf)
md5sums=('e2b6a355ab38934def0bea276b78d95c'
	'8d7eb834f07a5fee231fe726b4a510c2')
build()
{
	mkdir -p $pkgdir/usr/bin
	cp -v $srcdir/hync $pkgdir/usr/bin
	chmod 0755 $pkgdir/usr/bin/hync
	mkdir -p $pkgdir/usr/share/hync
	cp -v $srcdir/sample.conf $pkgdir/usr/share/hync/
}

