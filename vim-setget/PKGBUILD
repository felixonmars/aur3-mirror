# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-setget
pkgver=0.1
_scriptid=10768
pkgrel=1
pkgdesc="setter and getter for php"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2667"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('94fd3566cdc4e78fe1df0491e042499e'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/setget.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
