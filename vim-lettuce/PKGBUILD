# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-lettuce
pkgver=1.2
_scriptid=7471
pkgrel=2
pkgdesc="highly detalized dark scheme for gui and 256 color terminal"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1975"
license=('unknown')
groups=('vim-plugins')
source=(lettuce.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        remove_ternary_conditional.diff)
md5sums=('8361182a15d224fec9e020919272cc1f'
         'ad6470003824e3c674f64802aef43f2c')

build() {
    patch lettuce.vim remove_ternary_conditional.diff
    install -Dm644 ${srcdir}/lettuce.vim ${pkgdir}/usr/share/vim/vimfiles/colors/lettuce.vim
}
