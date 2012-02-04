# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-sokoban
pkgver=1.3
_scriptid=656
pkgrel=1
pkgdesc="Sokoban Game for Vim!"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=211"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('c2fee9eb8620ec53a88d4a41f319bffb'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/plugin
    install -Dm755 ${srcdir}/VimSokoban/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

