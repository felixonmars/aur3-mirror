# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-kalt
pkgver=1.1
_scriptid=10921
pkgrel=1
pkgdesc="A cold colorscheme."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2689"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('1749caa98e95a13ba64fde86cebd0a61'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/kalt.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
