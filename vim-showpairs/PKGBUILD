# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-showpairs
pkgver=2.1
_scriptid=5096
pkgrel=1
pkgdesc="Highlights the matching pair surrounding the current cursor location"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=626"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e541e1224150a03db81cdb3e52610230'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/showpairs.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
