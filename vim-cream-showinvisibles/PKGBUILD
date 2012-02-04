# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cream-showinvisibles
pkgver=3.01
_scriptid=2847
pkgrel=1
pkgdesc="Toggle view of invisible tabs, returns, trailing spaces"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=363"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('c091a100c3ad3fdb93fa61998e3a9fbb'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/cream-showinvisibles.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
