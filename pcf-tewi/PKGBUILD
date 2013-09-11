pkgname=pcf-tewi
_gitname=tewi-font
pkgver=1.0
pkgrel=1
pkgdesc='A bitmap font'
arch=('any')
url="https://github.com/neeee/tewi-font"
license=('custom:GPL3')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('xorg-bdftopcf')
conflicts=('bdf-tewi-git')
install="$pkgname.install"
source=("https://github.com/neeee/tewi-font/archive/$pkgver.tar.gz")
sha1sums=('13a1f31ad483bf2f98cee6e7449eb8c441843b81')

build() {
	cd "$srcdir/$_gitname-$pkgver"
	for file in *.bdf; do
		bdftopcf -o "${file%\.*}.pcf" "$file"
	done
}

package() {
	cd "$srcdir/$_gitname-$pkgver"
	install -Dm644 "Tewi-bold-11.pcf" \
		"${pkgdir}/usr/share/fonts/misc/Tewi-bold-11.pcf"
	install -Dm644 "Tewi-normal-11.pcf" \
		"${pkgdir}/usr/share/fonts/misc/Tewi-normal-11.pcf"
	install -Dm644 "COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
