# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=vim-pythoncomplete
pkgver=0.9
_scriptid=10872
pkgrel=1
pkgdesc="Python Omni Completion"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1542"
license=('custom')
depends=('vim' 'python2')
source=(pythoncomplete.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('6e7adfbd5d26c1d161030ec203a7f243')
build() {
    install -Dm644 ${srcdir}/pythoncomplete.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/pythoncomplete.vim || return 1
}
