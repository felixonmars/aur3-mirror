# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-hicurline
pkgver=6
_scriptid=4795
pkgrel=1
pkgdesc="Highlights the current line"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=555"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('1963a3f816358bdab475c2fb1020a628'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/HiCurLine.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
