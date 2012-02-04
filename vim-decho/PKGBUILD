# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-decho
pkgver=20
_scriptid=9388
pkgrel=1
pkgdesc="Vim script internal debugger (output in separate window, tab, or remote vim)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=120"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('15007341b47d6bffede5922608d70be1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,syntax}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/syntax/* ${pkgdir}/usr/share/vim/syntax/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

