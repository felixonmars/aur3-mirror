pkgname=ttf-liberation1
pkgver=1.07.4
pkgrel=1
pkgdesc="Red Hat's Liberation fonts - previous release"
arch=('any')
license=('custom' 'GPL2')
url='https://www.redhat.com/promo/fonts/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-liberation')
provides=('ttf-font')
install=ttf.install
source=("https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-$pkgver.tar.gz")
sha1sums=('c36bccbf6a0e562fa5a7b4b832af7185fa7f8a4b')

package() {
	cd "$srcdir/liberation-fonts-ttf-$pkgver"

	install -d "$pkgdir/usr/share/fonts/TTF/"
	install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
