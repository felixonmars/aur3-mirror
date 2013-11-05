# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=vim-syntax-haskell
pkgver=1.4
pkgrel=3
pkgdesc="Improvements on Vim's default \"haskell.vim\" syntax file"
arch=('any')
url="https://github.com/urso/haskell_syntax.vim"
license=('unknown')
depends=('vim')
install=${pkgname}.install
source=("https://raw.github.com/urso/haskell_syntax.vim/master/syntax/haskell.vim")
sha512sums=('11e8ce85db71932bcca8abe106c5aa7c9efcc259e8109eb7717a45fd1cb3351212324e10465619b5e0c7a7382707d073ed37e81114aafc784df232813a050774')

package() {
	install -Dm644 "${srcdir}/haskell.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/haskell.vim"
}
