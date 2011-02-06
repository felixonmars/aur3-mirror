# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-signdiff
pkgver=0.0.2
_scriptid=11023
pkgrel=1
pkgdesc="show the diff status at left sidebar"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2712"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('6e2a80d73e3563ec4a4c9e7882b84224'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/sign-diff.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
