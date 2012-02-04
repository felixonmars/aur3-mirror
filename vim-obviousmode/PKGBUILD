# Maintainer: Raphael Scholer <rscholer@gmx.de>
pkgname=vim-obviousmode
pkgver=1.22
_scriptid=13954
pkgrel=1
pkgdesc="Indicate current mode visually"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2212"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('1f1d7b53b9b200d2f35b86018f69feb3'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install --verbose -m 644 -D ${srcdir}/${pkgname} \
        ${pkgdir}/usr/share/vim/vimfiles/plugin/obviousmode.vim
    install --verbose -m 644 -D ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
