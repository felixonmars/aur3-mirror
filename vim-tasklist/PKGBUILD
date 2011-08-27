# Maintainer: Raphael Scholer <rscholer@gmx.de>
pkgname=vim-tasklist
pkgver=1.0.1
_scriptid=10388
pkgrel=7
pkgdesc="Eclipse like task list"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2607"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8308ca2c4b664a3435adf1b3af3273fa'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install --verbose -m 644 -D ${srcdir}/${pkgname} \
        ${pkgdir}/usr/share/vim/vimfiles/plugin/tasklist.vim
    install --verbose -m 644 -D ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

