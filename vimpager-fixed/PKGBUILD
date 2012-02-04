# Contributor: sudokode <don't email me>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
#
# This downloads a dos2unix'ed version from my site.

pkgname=vimpager-fixed
pkgver=1.4.8
pkgrel=1
pkgdesc="A vim-based script to use as a PAGER. Fixed."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1723"
license=('custom:vim')
depends=('vim')
conflicts=('vimpager')
source=("http://sudokode.net/tim/vimpager-1.4.8" 
	license.txt)
md5sums=('3e8fe35e82e78126a2aa56a7ef6ed032'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')

build() {
	/bin/true
}

package() {
	cd "${srcdir}"

	install -Dm755 vimpager-$pkgver "${pkgdir}/usr/bin/vimpager"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
