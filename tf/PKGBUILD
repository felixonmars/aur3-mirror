# Maintainer: Matthew Longley <randomticktock@gmail.com>

pkgname='tf'
pkgver='50b8'
pkgrel='1'
pkgdesc="A flexible, screen-oriented MUD client, for use with any type of MUD."
arch=('i686' 'x86_64')
url='http://tinyfugue.sourceforge.net'
license=('GPL2')
depends=('ncurses' 'openssl' 'pcre' 'zlib')
source=("http://downloads.sourceforge.net/sourceforge/tinyfugue/$pkgname-$pkgver.tar.gz"
        'tf-50b8.pcre.patch')
md5sums=('3e994e791966d274f63b0e61abf2ef59'
         'c6fa5c160f5ee4e99af6965a0ffbab4b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/tf-50b8.pcre.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
	gzip -c9 "$srcdir/$pkgname-$pkgver/src/tf.1.nroffman" > "$srcdir/$pkgname-$pkgver/src/tf.1.gz"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	make prefix="$pkgdir/usr" install
	install -m644 "$srcdir/$pkgname-$pkgver/src/tf.1.gz" "$pkgdir/usr/share/man/man1"
}
