# Contributor: bocke <bocke@mycity.rs>

pkgname=deroff
pkgver=2.0
pkgrel=1
pkgdesc="Removes roff constructs from documents"
arch=('i686' 'x86_64')
url="http://www.moria.de/~michael/deroff/"
license=('gpl')
source=('http://www.moria.de/~michael/deroff/deroff-2.0.tar.gz')
md5sums=('dcc4ce030ca719a36f34b01c8afebfda')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
	make prefix="$pkgdir/usr" install

	# Moving man pages to appropriate location
	mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"

	# Compressing man pages
	gzip "$pkgdir/usr/share/man/man1/$pkgname.1"
	gzip "$pkgdir/usr/share/man/de/man1/$pkgname.1"

	# Installing docs
	install -d -m755 "$pkgdir/usr/share/doc/$pkgname-$pkgver"
	install -m644 "$srcdir/$pkgname-$pkgver/README" \
		"$pkgdir/usr/share/doc/$pkgname-$pkgver"
	install -m644 "$srcdir/$pkgname-$pkgver/NEWS" \
		"$pkgdir/usr/share/doc/$pkgname-$pkgver"

	# Installing license
	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir/$pkgname-$pkgver/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname"
}
		
