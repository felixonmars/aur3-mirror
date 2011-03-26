# Maintainer: Wu Yang <wuyangnju at gmail dot com>
pkgname=vim-winmanager
pkgver=2.3
pkgrel=3
pkgdesc="A window-manager plugin for Vim 7.2"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=95"
license=('custom')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=754
        license.txt)
md5sums=('dbabca4006a09798d05e3963d46a4217'
         'efbd5986e691ce8c876fb86e8f5961ea')
build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/vimfiles/doc/ && \
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
