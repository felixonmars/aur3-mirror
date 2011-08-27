# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-runscript
pkgver=1.1
_scriptid=310
pkgrel=1
pkgdesc="Plugin for running Python scripts"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=127"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('68f273a222df1d7acc31b0d193cc3ca1'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/runscript.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
