# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-javascript
pkgver=0.1patch2
_scriptid=7708
pkgrel=2
pkgdesc="This indentation script for OOP javascript (especially for EXTJS)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1936"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('3c6a8ea7e1914b3087926faff8f5909c'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/javascript.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
