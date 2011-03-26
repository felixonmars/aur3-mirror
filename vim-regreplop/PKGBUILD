# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-regreplop
pkgver=1.1
_scriptid=10960
pkgrel=1
pkgdesc="operator to replace motion/visual with a register"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2702"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('77acee8141d3ad030ba3b9af1e0fdfd5'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/regreplop.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
