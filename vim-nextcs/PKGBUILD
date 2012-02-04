# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-nextcs
pkgver=0.0.1
_scriptid=11018
pkgrel=1
pkgdesc="Change your color scheme easily"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2713"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bc613d30eb59dd1ec735003a7e4fcd1b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/nextCS.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
