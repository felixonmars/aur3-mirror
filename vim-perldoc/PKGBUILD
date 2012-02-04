# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-perldoc
pkgver=1.1.1
_scriptid=1002
pkgrel=1
pkgdesc="perldoc command from vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=209"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('923ffbd717a7fe572a3822f83be2fbc7'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,ftplugin,syntax}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/ftplugin/* ${pkgdir}/usr/share/vim/ftplugin/ || return 1
    install -Dm755 ${srcdir}/syntax/* ${pkgdir}/usr/share/vim/syntax/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

