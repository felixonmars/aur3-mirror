# Maintainer: bigpool <wutaojiong @ gmail at com>
pkgname=vim-highlight
pkgver=1.6
_scriptid=15438
pkgrel=1
pkgdesc="Highlight lines or patterns of interest in different colors"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1599"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(highlight.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8ef564f5c3456cf04a92932ba5192bec'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/highlight.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/highlight.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
