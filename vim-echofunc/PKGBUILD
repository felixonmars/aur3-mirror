# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-echofunc
pkgver=2.0
_scriptid=17383
pkgrel=1
pkgdesc="Echo the function declaration in the command line for C/C++"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1735"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(echofunc.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('5fe469adae3b9f8e6fc760f628f6b743'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/echofunc.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/echofunc.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
