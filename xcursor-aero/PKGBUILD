# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=xcursor-aero
pkgver=0.2
pkgrel=2
pkgdesc='Aero Mouse Cursors with Drop Shadow'
url='http://www.xfce-look.org/content/show.php/Aero+Mouse+Cursors+with+Drop+Shadow?content=67833'
arch=('any')
license=('GPL')
source=(
	'http://www.infinality.net/files/aero.tar.gz'
	'http://www.infinality.net/files/aero-drop.tar.gz'
	'http://www.infinality.net/files/aero-large.tar.gz'
	'http://www.infinality.net/files/aero-large-drop.tar.gz'
	'http://www.infinality.net/files/aero-extra-large.tar.gz'
	'http://www.infinality.net/files/aero-extra-large-drop.tar.gz'
)
md5sums=(
	'a6e1e7381ea034da113319bdab3e3f81'
	'6b2bf61d0d3c7032650317549d931d57'
	'b76784f78f772425a5dd16e8faa402ed'
	'8ff7b4c4b4b244d08f036af7ddcc389a'
	'bf404f7f9c3766b110f6e39db3fcf342'
	'b63b0f368c31ca9cc6afc2601b6c8502'
)

package() {
	mkdir -p "$pkgdir/usr/share/icons"

	cp -r \
		"$srcdir/aero" \
		"$srcdir/aero-drop" \
		"$srcdir/aero-extra-large" \
		"$srcdir/aero-extra-large-drop" \
		"$srcdir/aero-large" \
		"$srcdir/aero-large-drop" \
		"$pkgdir/usr/share/icons"
}
