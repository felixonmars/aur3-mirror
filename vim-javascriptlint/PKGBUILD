# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-javascriptlint
pkgver=0.2
_scriptid=10540
pkgrel=2
pkgdesc="Displays JavaScript Lint warnings in the quickfix error window"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2578"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('82790b26cae354f5bf6bcd75a6ecabd3'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/javaScriptLint.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

