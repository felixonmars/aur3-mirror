# Contributor: ptarh <pti4ki@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=chktex
pkgver=1.6.4
pkgrel=2
pkgdesc="syntax checker for LateX"
arch=('i686' 'x86_64')
url="http://baruch.ev-en.org/proj/chktex"
license=('GPL2')
#depends=
source=("http://baruch.ev-en.org/proj/chktex/$pkgname-$pkgver.tar.gz")
md5sums=('e1d1f70d37e97734a69c94682a2038a0')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
	make ChkTeX.pdf || return 1
	make prefix=$startdir/pkg/usr install || return 1
	install -Dm644 ChkTeX.pdf $pkgdir/usr/share/doc/chktex/ChkTeX.pdf \
	  || return 1
	install -m644 *.1 $pkgdir/usr/share/man/man1 || return 1
       }
