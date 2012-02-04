# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-jcommenter
pkgver=1.3.1
_scriptid=1587
pkgrel=1
pkgdesc="A script for automatically generating JavaDoc comments"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=20"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bba305107ca96378b5d0503ec4f04f88'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/macros/jcommenter.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
