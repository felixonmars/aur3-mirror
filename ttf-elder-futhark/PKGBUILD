# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-elder-futhark
pkgver=1.0
pkgrel=2
pkgdesc="True Type Fonts for ancient norse runes."
arch=('any')
url="http://www.mockfont.com/old/"
license=('custom')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("http://www.mockfont.com/old/files/runettf.zip")
md5sums=('ae63098448baf75cbaafa76ca63c0a24')
install=$pkgname.install

package () {
	cd "$srcdir"
	install -Dm644 RUNE.TTF "$pkgdir/usr/share/fonts/TTF/elder-futhark.ttf"
	# not exactly sure where to put this, but this should do
	install -Dm644 RUNE.WRI "${pkgdir}/usr/share/doc/ttf-eldar-futhark/README.doc"
	install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/elder-futhark/license.txt"
}

# vim:set ts=2 sw=2 et:
