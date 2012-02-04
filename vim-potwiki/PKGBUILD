# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-potwiki
pkgver=1.25
_scriptid=9316
pkgrel=1
pkgdesc="Maintain a Wiki of plain text files"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1018"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('410f47dcfd00c21be5a03d5c91a67f48'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/potwiki.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
