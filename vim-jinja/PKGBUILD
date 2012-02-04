# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
pkgname=vim-jinja
pkgver=1.1
pkgrel=3
_scriptid=8666
pkgdesc="Adds Jinja highlighting support to Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1856"
license=('unknown')
depends=('vim')
optdepends=('python-jinja')
groups=('vim-plugins')
install=vim-jinja.install
source=(jinja.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('cc524898b9b8a3001ad1fa8dbd4c73fe')

build() {
	:
}

package() {
	cd ${srcdir}
	local _installpath="${pkgdir}/usr/share/vim/vimfiles"
	install -Dm644 jinja.vim \
		${_installpath}/syntax/jinja.vim || return 1
}
