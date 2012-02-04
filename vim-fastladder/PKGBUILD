# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fastladder
pkgver=0.9
_scriptid=10882
pkgrel=1
pkgdesc="vimscript for fastladder"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2683"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('6d346365913da509b99cfeae6f203bda'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/fastladder.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
