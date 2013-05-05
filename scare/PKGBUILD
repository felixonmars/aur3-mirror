pkgname=scare
pkgver=1.3.10
pkgrel=2
pkgdesc="An Adrift game interpreter."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/scarehome/"
license=('GPL')
depends=('libx11' 'libpng>=1.5.0' 'libjpeg') # only needed for glkscare with xglk
source=(http://mirror.ifarchive.org/if-archive/programming/adrift/$pkgname-$pkgver.zip
	http://www.ifarchive.org/if-archive/programming/glk/implementations/xglk-0411.tar.Z
	xglk-0411-linux.patch
	xglk-0411-png15.patch)
md5sums=('5312c6d43e72c9b2800742b272901f9d'
	'd625bd0fde87969582f857109ed3a602'
	'c8365f21a7ff6a98198aa7c8dde9af27'
	'3c4895a22b0afd5e923b105ae72b13dd')

build() {
	# first build xglk library
	cd "$srcdir/xglk"
	# patch from http://www.ifarchive.org/if-archive/programming/glk/implementations/patches/xglk-0411-linux-patch.tar.gz
	patch -p1 <"$srcdir/xglk-0411-linux.patch"
	# fix for png 1.5.x
	patch -p1 <"$srcdir/xglk-0411-png15.patch"

	make

	# now build scare
	cd "$srcdir/$pkgname-$pkgver"
	make scare
	make glkscare
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./source/scare "$pkgdir/usr/bin/scare"
	install -Dm755 ./source/glkscare "$pkgdir/usr/bin/glkscare"
}
