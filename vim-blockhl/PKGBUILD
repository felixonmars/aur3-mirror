# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-blockhl
pkgver=4
_srcid=3201
pkgrel=4
pkgdesc='Highlights indentation blocks with different shades of gray, based on {} (curly braces) level'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=104'
license=('Vim')
depends=('vim')
conflicts=('vim-blockhl-dev')
install=${pkgname}.install
source=("${pkgname}.bz2::http://www.vim.org/scripts/download_script.php?src_id=${_srcid}")
sha512sums=('8e7c952b30e4b166605296c15215975321487b62928deedee143bff907b2088581f7d3434f3eeaff7adad8c971c5c4d76fe6e7ab13bba5023f22ecfec3b40dfb')

package() {
	install -Dm644 "${srcdir}/${pkgname}" "${pkgdir}/usr/share/vim/vimfiles/after/syntax/c.vim"
}
