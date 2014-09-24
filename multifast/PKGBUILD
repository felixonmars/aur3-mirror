# Maintainer: daurnimator <quae@daurnimator.com>
pkgname=multifast
pkgver=1.4.2
pkgrel=2
pkgdesc="A fast multiple string search tool which implements Aho-Corasick Algorithm."
arch=('i686' 'x86_64')
url="http://multifast.sourceforge.net/"
license=('LGPL3')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
md5sums=('973bb9c2777248d2a71e9ae7375678f7'
         'a05ac372d600405bc1372a620b6b1785')

prepare() {
	cd "$srcdir"
	patch -p1 -i "$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-v$pkgver/ahocorasick"
	make
	cd "$srcdir/$pkgname-v$pkgver/multifast"
	make
}

check() {
	cd "$srcdir/$pkgname-v$pkgver/multifast/build"
	./multifast -P ../test/cities.pat -nxrpiv ../test/input1.txt
	./multifast -P ../test/cities.pat -nxrp ../test/input1.txt ../test/input2.txt
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	install -D -m644 ahocorasick/build/libahocorasick.a "$pkgdir/usr/lib/libahocorasick.a"
	install -D -m755 ahocorasick/build/libahocorasick.so.0 "$pkgdir/usr/lib/libahocorasick.so.0"
	ln -s libahocorasick.so.0 "$pkgdir/usr/lib/libahocorasick.so"
	install -D -m644 ahocorasick/actypes.h "$pkgdir/usr/include/$pkgname/actypes.h"
	install -D -m644 ahocorasick/ahocorasick.h "$pkgdir/usr/include/$pkgname/ahocorasick.h"
	install -D -m755 multifast/build/multifast "$pkgdir/usr/bin/multifast"
	install -d "$pkgdir/usr/share/doc/"
	cp -r documentation "$pkgdir/usr/share/doc/$pkgname"
}
