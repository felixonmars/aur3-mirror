# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-ant_menu
pkgver=0.5.7.1
_scriptid=10729
pkgrel=2
pkgdesc="Vim plugin for ant"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=155"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('213be2093a2fdeaa895faf0651bd6be2'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname}.vim ${pkgdir}/usr/share/vim/plugin/${pkgname}.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

