# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-up2picasaweb
pkgver=0.1
_scriptid=10473
pkgrel=1
pkgdesc=" upload image to picasaweb with vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2621"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bc6153a88d5290b73ca26d00311bb09a'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/up2picasaweb.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
