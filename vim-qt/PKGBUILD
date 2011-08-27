# Maintainer: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-qt
pkgver=0.4
_scriptid=1905
pkgrel=1
pkgdesc="Tiny tool for the uic used in Qt from Trolltech"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=609"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0560b29cf2dcdd40e4e153c6b34918cd'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vimfiles/vim/colors/Qt.vim || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
