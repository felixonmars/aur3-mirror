# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.44b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!makeflags' '!strip')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('f5ddf507659eaf7d8c68b18327aa20c5335e99974f5e8477126f7bb5eb5cfc86c69b15e018140fb43c35c524d29596196ea4793476a5e29250ab04e7a148315b')

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
