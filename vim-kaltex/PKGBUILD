# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-kaltex
pkgver=1.1
_scriptid=10922
pkgrel=1
pkgdesc="A colder colorscheme..."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2690"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('d03d3b5729b79e68a8f260d7856243ad'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/kaltex.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
