# Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>
pkgname=vim-commentop
pkgver=1.1.1
_scriptid=11064
pkgrel=2
pkgdesc="commands and operators to comment/uncomment lines in many languages"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2708"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('ef13b4219956683fd540ffd10f567e8c'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/commentop.vim 
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
