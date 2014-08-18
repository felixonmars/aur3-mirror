# Maintainer: Ronald Kinard <furyhunter600@gmail.com>
# Contributer: Josh Kropf <josh@slashdev.ca>
# Contributor: Bartosz Chmura <chmurli at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=sublime-text-beta
pkgver=3.0.3059
pkgrel=2
pkgdesc="sophisticated text editor for code, html and prose, beta version"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/3"
license=('custom')
depends=(libpng gtk2 xdg-utils desktop-file-utils)
provides=(sublime-text)
install=${pkgname}.install
_arch='x64'
_archurl='x64'

[[ "${CARCH}" = i686 ]] && _arch='' && _archurl='x32'

source=(
        "http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3059_${_archurl}.tar.bz2"
	sublime-text.desktop
	subl
)

md5sums=(
	'9fd1828ef4bc71f375b872eb139e9eba'
	'f6d0e7f5da0e8c1d57640f62173295bf'
	'6d487b24e76dd1a6ba6efed841db6731'
)

[[ "${CARCH}" = i686 ]] && md5sums[0]='8d9f21fedb4a7b73137e9f58bc817b98'

package () {
	cd "${srcdir}"

	install -Dm644 sublime-text.desktop \
		"${pkgdir}/usr/share/applications/sublime-text.desktop"

	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r "sublime_text_3" \
		"${pkgdir}/opt/${pkgname}"

	for res in 128x128 16x16 256x256 32x32 48x48; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		ln -s /opt/${pkgname}/Icon/${res}/sublime_text.png \
			"${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime_text.png"
	done

	install -Dm755 subl "${pkgdir}/usr/bin/subl"
}
