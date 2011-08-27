# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-liblist
pkgver=0.1
_scriptid=421
pkgrel=2
pkgdesc="Library of functions to work with lists/arrays"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=166"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('ac229eab498c97f830bc48846a2548b1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/libList.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
