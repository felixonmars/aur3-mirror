# Maintainer: Karl Nicoll <karl@whoiskarl.com>
pkgname=gtksourceview-style-zenburn
pkgver=1.0.0
pkgrel=1
pkgdesc="Zenburn color scheme for GtkSourceView-based editors like Gedit."
arch=(any)
depends=('gtksourceview3')
license=('LGPL3')
source=($pkgname-$pkgver.tar.gz::https://github.com/karlnicoll/zenburn-gtksourceview/archive/1.0.0.tar.gz)
url=('https://github.com/karlnicoll/zenburn-gtksourceview')
md5sums=('04cd490a55fcdc2d59a9a240a6fed151')

build() {
	pushd "${srcdir}/zenburn-gtksourceview-${pkgver}/" || return 1
	
	# Copy style file.
	install -D -m644 zenburn.xml "${pkgdir}/usr/share/gtksourceview-3.0/styles/zenburn.xml"
	
	# Copy license file(s).
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -D -m644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER"

	popd
}
