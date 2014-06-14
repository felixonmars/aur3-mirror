_pkgname=MediaCrush-cli
pkgname=mediacrush-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Upload media files to https://mediacru.sh"
arch=("any")
url="https://github.com/MediaCrush/MediaCrush-cli"
license=("MIT")
makedepends=("asciidoc")
optdepends=("xdg-utils: Open uploaded files in your browser")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaCrush/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=("01bbabf8843577bcbea5b6d669e000f22c344b5cda0f6d84fc59dfb88201dd55")

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	make install DESTDIR="$pkgdir/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
