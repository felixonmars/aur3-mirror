# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-qbuf
pkgver=1.12
_scriptid=9909
pkgrel=2
pkgdesc="Very small, clean but quick and powerful buffer manager!"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1910"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('511cae3faabc9229f1ded92409b7e0ac'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/qbuf.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
