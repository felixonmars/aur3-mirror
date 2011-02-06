# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-borland
pkgver=1.0
_scriptid=188
pkgrel=1
pkgdesc="Classic borland IDE like Vim color scheme"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=92"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('a92f3e7aba709c199d0dffcc4729af51'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/inkpot.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
