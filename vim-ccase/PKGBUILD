# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ccase
pkgver=1.38
_scriptid=3420
pkgrel=1
pkgdesc="Script to setup maps/menus to add in using Clearcase"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=15"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('b3f67a18b5de8c89b6bc81cd382224e1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/ccase.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
