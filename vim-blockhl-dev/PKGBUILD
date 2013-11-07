# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=vim-blockhl-dev
pkgver=20110922
pkgrel=1
pkgdesc='Highlights indentation blocks with different shades of gray, based on {} (curly braces) level (development version)'
arch=('any')
url='http://www.drchip.org/astronaut/vim/doc/blockhl.txt.html'
license=('Vim')
depends=('vim')
conflicts=('vim-blockhl')
install=${pkgname}.install
source=('http://www.drchip.org/astronaut/vim/vbafiles/blockhl.vba.gz')
sha512sums=('9b54ca92a74995495486e9975ce8999c1819e2e2149a8af9cc41523bc0696beb60c8a1bd16b886d03e2178b4dfaf5ffaad4cfa50eddc38d49a433f126c437be3')

prepare() {
	cd "${srcdir}"

	# this is an ugly hack to workaround the limitations of installing a
	# vimball via makepkg/pacman
	head -n 149 blockhl.vba | tail -n 144 > blockhl.vim
	echo "endif" >> blockhl.vim
	tail -n 68 blockhl.vba | head -n 66 > blockhl.txt
}

package() {
	cd "${srcdir}"

	install -Dm644 'blockhl.vim' "${pkgdir}/usr/share/vim/vimfiles/plugin/blockhl.vim"
	install -Dm644 'blockhl.txt' "${pkgdir}/usr/share/vim/vimfiles/doc/blockhl.txt"
}
