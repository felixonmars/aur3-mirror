# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-inkpot
pkgver=7.0
_scriptid=5747
pkgrel=2
pkgdesc="Inkpot, a dark scheme for GUI and 88/256 colour terms"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1143"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('c08151ab4143af39a6470cf51cd0e006'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vim72/colors/inkpot.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
