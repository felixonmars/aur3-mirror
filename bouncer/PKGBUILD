# Maintainer: Christian Weber <ChristianWeber802 at gmx dot net>

pkgname=bouncer
pkgver=0.2.0
pkgrel=1
pkgdesc="Close windows gracefully with a timeout."
arch=('i686' 'x86_64')
url="https://github.com/TheWebster/bouncer/"
license=('custom:BSD')
depends=('libxcb')
makedepends=('libxcb')
source=("https://github.com/TheWebster/bouncer/archive/v$pkgver.tar.gz")
md5sums=('d7c339c3af5468d1c4a0c0fa963edbd6')


build() {
	cd "$srcdir/bouncer-$pkgver"
	make -s
}

package() {
	cd "$srcdir/bouncer-$pkgver"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man" "$pkgdir/etc" \
	         "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENCE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
	make -s prefix="$pkgdir" install
}
