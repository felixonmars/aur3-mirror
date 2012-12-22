# Maintainer: Kamil Stachowski <kamil.stachowski@at@gmail.com>

pkgname=vim-nrrwrgn
pkgver=0.29
pkgrel=1
pkgdesc="A Narrow Region Plugin (similar to Emacs)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3075"
license=('vim')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
optdepends=()
provides=('vim-nrrwrgn')
conflicts=()
_vimname="NrrwRgn"
source=("${_vimname}-${pkgver}.vmb::http://www.vim.org/scripts/download_script.php?src_id=18441")
md5sums=('070116eee66edfa74465f6965c38d504')
install=vimdoc.install

build () {
	mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
	vim "${_vimname}-${pkgver}.vmb" -N	\
		-c "UseVimball ../pkg/usr/share/vim/vimfiles/" -c "q"
}

package () {
	# possibly conflicting, and will be regenrated by vimdoc.install
	rm -rf "$pkgdir/usr/share/vim/vimfiles/doc/tags"
}
