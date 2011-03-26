# $Id$
# Maintainer: 

pkgname=vim-screen
_vimplugin=screen
pkgver=0.8
_scriptid=11519
pkgrel=1
pkgdesc="Start gnu screen w/ your vim session and a split shell + send commands to the sh."
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2711"
license=('BSD')
depends=('vim>=7.2' 'screen')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        vim-screen.txt)
md5sums=('23756648b3bd1d2d1a4a91d204be5576'
         '7f59b1d6165d6608cbc203f7328f4cc9')

build() {
	install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/${_vimplugin}.vim || return 1
	install -Dm644 ${srcdir}/${pkgname}.txt ${pkgdir}/usr/share/vim/vimfiles/doc/${pkgname}.txt || return 1
}
# vim:set ts=2 sw=2 et:
