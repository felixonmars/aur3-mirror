# Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=vim-blockcomment
pkgver=1.1
_scriptid=1387
pkgrel=3
pkgdesc="Simple commenting and uncommenting of blocks of code"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=473"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8935c04deb45feda2bd3350bf434f7d4'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/BlockComment.vim 
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
