# Contributor: david "mutterschiff" becker <david dot becker at gmx dot org>

pkgname=xcursor-vienna3-small
pkgver=1.0
pkgrel=1
pkgdesc="J. Aroche's Vienna3 for CursorXP, converted to an X11 cursor. Small Version"
arch=('any')
license=('GPL')
url=("http://dasmau89.deviantart.com/art/vienna3small-318929720")
source=("http://www.deviantart.com/download/318929720/vienna3small_by_dasmau89-d59vrqw.tar.gz")
md5sums=('84941e67dab1156f06cd377cf08752c7')

package() {
	install -d "${pkgdir}/usr/share/icons/Vienna3Small"
	install -d "${pkgdir}/usr/share/icons/Vienna3Small/cursors"
	#install -D -m644 "${srcdir}/Vienna3Small/"{cursors/*,index.theme,cursor.theme} "${pkgdir}/usr/share/icons/Vienna3Small/"
	mv ${srcdir}/cursors ${pkgdir}/usr/share/icons/Vienna3Small/
	install -D -m644 "${srcdir}/index.theme" "${pkgdir}/usr/share/icons/Vienna3Small/"
	install -D -m644 "${srcdir}/cursor.theme" "${pkgdir}/usr/share/icons/Vienna3Small/"
}
