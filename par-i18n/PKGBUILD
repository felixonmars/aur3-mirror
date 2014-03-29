# Maintainer: Jan Christoph Ebersbach <jceb@e-jc.de>
pkgname=par-i18n
pkgver=1.52
pkgrel=3
pkgdesc='par is a paragraph reformatter, vaguely similar to fmt, but better'
arch=('i686' 'x86_64')
url='http://www.nicemice.net/par/'
depents=('glibc')
replaces=('par')
provides=('par')
conflicts=('par')
license=('Custom')
source=('http://www.nicemice.net/par/Par152.tar.gz'
		'http://www.nicemice.net/par/par_1.52-i18n.3.diff.gz'
		'http://www.nicemice.net/par/Par152-autoconf.tar.gz'
		'fix_tests.patch')
md5sums=('4ccacd824171ba2c2f14fb8aba78b9bf'
		'e79b448cb14323a39d817afce4847cdf'
		'83e4d23a943ab07c44dd995b73195c70'
		'b56f4c85cfbbbff3f8ca814abf17bbfd'
		)
sha1sums=('4b83d2ec593bb45ee46d4b7c2bfc590e1f4a41a8'
		'2a4fec5c2509be0dbd32c4706c245326db6dfeac'
		'727f8b0fa371010e25f4c004735248a017fcca8e'
		'9d8f755379a177b4fbef8a422f6506e2d902ba8f'
		)
sha256sums=('33dcdae905f4b4267b4dc1f3efb032d79705ca8d2122e17efdecfd8162067082'
		'cc2e2c7943b73d9ea893717f669ec7f1665188dd8bedd45aeaca027c30b056bb'
		'034fb943236523629eefee0a33fc6afb5b881648a2fc5c6bef7fd1b89ce44d34'
		'0cceb6c65d48ea52628fe97bb4d3ac631dda7f4f8edf6e4723dd3b23e7ce8f6b'
		)

prepare() {
	[ -e "$srcdir/$pkgname-$pkgver" ] && rm -rf "$srcdir/$pkgname-$pkgver"
	mv "$srcdir/Par152" "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver"
	[ ! -e Makefile ] && gunzip -c < "$srcdir/par_1.52-i18n.3.diff.gz" | patch -p1
	patch -p1 < "$srcdir/fix_tests.patch"
	rm -rf debian
	rm -f Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install --mode=755 -D par "${pkgdir}/usr/bin/par"
	install --mode=644 -D par.1 "${pkgdir}/usr/share/man/man1/par.1"
	install --mode=644 -D par.doc "${pkgdir}/usr/share/licenses/${pkgname}/par.doc"
}
