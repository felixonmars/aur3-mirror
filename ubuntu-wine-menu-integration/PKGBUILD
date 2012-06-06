# Maintainer: Faheem Pervez <trippin1@gmail.com>
pkgname=ubuntu-wine-menu-integration
pkgver=1.4
_winever="wine${pkgver}"
_ubuver="0ubuntu4"
pkgrel=1
pkgdesc="XDG etc. files from Ubuntu's Wine package to integrate it into DEs' app launchers, with binfmt file"
arch=('any')
url="http://packages.ubuntu.com/${_winever}"
license=('LGPL2.1')
depends=('wine' 'xdg-utils' 'hicolor-icon-theme')
install="${pkgname}.install"
source=("http://se.archive.ubuntu.com/ubuntu/pool/universe/w/${_winever}/${_winever}_${pkgver}-${_ubuver}_i386.deb"
	'01-fix-browse-drive-c-kde.patch'
	'wine.conf')
md5sums=('f202898b3c40bace4bb97e577f76a75f'
	 '5bed5667677f102b7ab9ab3b415f83c1'
	 '599bc907c9ae3fa371e8032b6db735dc')

package() {
	cd "${pkgdir}"
	gunzip -c "${srcdir}"/data.tar.gz | tar --preserve-permissions -xf - ./etc/xdg/ ./usr/share/desktop-directories ./usr/share/applications/ ./usr/share/icons --exclude=wine.desktop
	mkdir --mode=0755 "${pkgdir}"/etc/xdg/menus/kde-applications-merged
	for i in `basename "${pkgdir}"/etc/xdg/menus/applications-merged/*`; do
		ln -sf /etc/xdg/menus/applications-merged/"$i" "${pkgdir}"/etc/xdg/menus/kde-applications-merged/"$i"
	done

	install -D -m644 "${srcdir}"/wine.conf "${pkgdir}"/usr/lib/binfmt.d/wine.conf

	patch -Np1 -i "${srcdir}"/01-fix-browse-drive-c-kde.patch
}
