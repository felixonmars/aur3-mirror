# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-haskell
pkgver=1.2.1
_scriptid=10635
pkgrel=1
pkgdesc=" Updated with for in standalone deriving."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2641"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('a7bfbbdd42de59096ebce629ccd0a670'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/haskell.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
