# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ywvim
pkgver=1.17
_scriptid=10890
pkgrel=1
pkgdesc="Yet another input method(IM) for VIM, supports all modes"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2662"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('72d4c580111c346a123bddcbee56fcc1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/ywvim.vim ${pkgdir}/usr/share/vim/plugin/ywvim.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

