# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=nocache
pkgver=0.9
pkgrel=1
pkgdesc="minimize filesystem caching effects"
arch=('i686' 'x86_64')
url="https://github.com/Feh/nocache"
license=('BSD')
depends=('bash')
source=(http://github.com/Feh/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('3e1821c48a78282776bff495a5c3d749')
sha256sums=('a5d790b77dc9e0c8e1241f99a9f31a088d02956a6a4c40dd17ddaa887b2bc33a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
        sed -i 's|/usr/local|/usr|g' nocache.global
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
	install -D -m0644 nocache.so "$pkgdir"/usr/lib/nocache.so
        install -D -m0755 nocache.global "$pkgdir"/usr/bin/nocache
        install -D -m0755 cachestats cachedel "$pkgdir"/usr/bin/
        install -D -m0644 man/*.1 "$pkgdir"/usr/share/man/man1/
        install -D -m0644 README "$pkgdir"/usr/share/doc/$pkgname/README
        install -D -m0644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
