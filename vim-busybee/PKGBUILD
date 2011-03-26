# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-busybee
pkgver=1.0.1
_scriptid=10016
pkgrel=2
pkgdesc="a dark color scheme (modification of Mustang.vim)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1549"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(BusyBee.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('83621e2daa7892a3ef3aa92a83065eb7'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/BusyBee.vim ${pkgdir}/usr/share/vim/plugin/BusyBee.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

