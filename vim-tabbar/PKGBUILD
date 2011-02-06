# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-tabbar
pkgver=0.7
_scriptid=4976
pkgrel=1
pkgdesc="Plugin to add tab bar ( derived from miniBufExplorer)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1338"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e23ea66856a8a0cfe10776c5c3f8a699'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/tabbar.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
