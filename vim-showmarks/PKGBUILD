# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-showmarks
pkgver=2.2
_scriptid=3342
pkgrel=2
pkgdesc="Visually shows the location of marks."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=152"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(showmarks.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e2d683898c601e89f485d23c481ddbdd'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/showmarks.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/showmarks.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
