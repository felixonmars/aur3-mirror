# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.48b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!makeflags' '!strip')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('5dbc3877e01a63079ebe93278175af7b1f53eecc9e430653b82ade11e0764a2b9fbf2a039c2cb33fd2070b9c5a232e2e3212b170fae20294857dc8fe631d189d')

prepare() {
	cd $pkgname-$pkgver

	env _pkgdir="$pkgdir" perl -pe 's{/usr/local}{$ENV{_pkgdir}/usr}g' -i Makefile

	if [ "$CARCH" = 'x86_64' ]; then
		perl -pe 's{//\s*(?=#define\s+USE_64BIT)}{}' -i config.h
	fi
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver

	install --directory "$pkgdir"/usr/{bin,lib/$pkgname}

	make install
	strip -- "$pkgdir"/usr/bin/*

	install --directory "$pkgdir"/usr/share/doc/
	cp --recursive docs "$pkgdir"/usr/share/doc/$pkgname
	find "$pkgdir"/usr/share/doc/$pkgname -type f -exec chmod 644 -- '{}' +
}
