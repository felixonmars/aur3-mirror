# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-bufferlist
pkgver=1.3
_scriptid=4544
pkgrel=1
pkgdesc="Simple, fast, and slick non-disturbing buffer list"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1325"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2f44d737e0f60bde3c255c33d69b7272'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/bufferlist.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
