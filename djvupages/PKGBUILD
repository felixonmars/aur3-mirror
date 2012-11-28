# Maintainer: YL3DY <yl3gdy at archlinux dot us>

pkgname=djvupages
pkgver=1
pkgrel=1
arch=('any')
url="https://github.com/levantis/djvupages"
license=('GPL')
depends=('bash' 'djvulibre')
source=("https://github.com/levantis/djvupages/archive/$pkgver.tar.gz")
sha256sums=('f4600a40df4792cd31ce9ba2d9f72749602b4066926e253c7a5d5f5515aedfff')

pkgdesc="A tool to extract an arbitrary set of pages from a DjVu file and merge them in another file."

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/djvupages/README"
}
