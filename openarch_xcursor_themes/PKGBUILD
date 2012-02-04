# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_xcursor_themes
pkgver=0.1
pkgrel=3
pkgdesc="XCursor themes for OpenArch"
arch=('any')
groups=('openarh_gray')
url="http://gnome-look.org/index.php?xcontentmode=36"
license=('GPL')
depends=('gtk2' 'libxcursor')
source=('http://gnome-look.org/CONTENT/content-files/120603-pick.tar.gz'
	'http://gnome-look.org/CONTENT/content-files/61037-entis_cursors_x11_others.tgz'
	'http://gnome-look.org/CONTENT/content-files/27913-PolarCursorThemes.tar.bz2')

md5sums=('f03803659d1c17963f268f644921e972'
         '9e7809700f07da32f17116dd64f486b1'
         '886068e0feadd2a07c8b206b211548ec')
        
build() {
	cd "${srsdir}"
	install -m755 -d "${pkgdir}"/usr/share/icons
	find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -exec cp -R '{}' "${pkgdir}"/usr/share/icons \;
}

