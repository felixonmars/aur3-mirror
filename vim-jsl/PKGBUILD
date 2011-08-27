# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-jsl
pkgver=1.00.003
_scriptid=10576
pkgrel=1
pkgdesc="Compiler plugin for JavaScript Lint"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2630"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('30682e80c4ea38c3c41bf160f99d1b6c'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/ftplugin/jsl.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
