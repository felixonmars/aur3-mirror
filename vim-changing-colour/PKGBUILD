# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-changing-colour
pkgver=3.7
_scriptid=10997
pkgrel=1
pkgdesc="Changes highlight colours gradually based on the hour"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2658"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('f4566504105a8e9de90442eb43003fb9'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/changing-colour.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
