# Contributor: Raymano <re1212122000@yahoo.com>

pkgname=tivodecode
pkgver=0.1.4
pkgrel=2
arch=('i686' 'x86_64')
license=(BSD)
pkgdesc="Tivo file decoder"
url=('http://tivodecode.sourceforge.net/')
source=(http://downloads.sourceforge.net/tivodecode/$pkgname-$pkgver.tar.gz)
md5sums=('b0131ce1de4f2c2057f31a29f7f13c45')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/objects.dir/tivodecode" "$pkgdir/usr/bin/tivodecode"
	install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

