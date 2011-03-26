# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cvsmenu
pkgver=0.5.7.1
_scriptid=8868
pkgrel=2
pkgdesc="CVS(NT) integration plugin"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1245"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(cvsmenu.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d497b5ba9106a7e2ae2cec1105414171'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/cvsmenu.vim ${pkgdir}/usr/share/vim/plugin/cvsmenu.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

