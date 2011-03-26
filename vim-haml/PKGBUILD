# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-haml
pkgver=0.3
_scriptid=8461
pkgrel=2
pkgdesc="Haml syntax highlight"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1773"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('a44a8261982ee804351595eaa2324beb'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/haml.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
