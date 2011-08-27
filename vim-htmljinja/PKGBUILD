# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
pkgname=vim-htmljinja
pkgver=1.0
pkgrel=1
_scriptid=6961
pkgdesc="Adds Jinja highlighting support to Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1856"
license=('unknown')
depends=('vim' 'vim-jinja')
optdepends=('python-jinja')
groups=('vim-plugins')
install=vim-htmljinja.install
source=(htmljinja.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('f905c1ac7eac9055bcaf437542489cde')

build() {
	:
}

package() {
	cd ${srcdir}
	local _installpath="${pkgdir}/usr/share/vim/vimfiles"
	install -Dm644 htmljinja.vim \
		${_installpath}/syntax/htmljinja.vim || return 1
}
