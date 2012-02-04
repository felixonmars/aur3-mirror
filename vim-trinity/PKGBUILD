# Maintainer: Alexey Manaev <alex dot manaev at gmail dot com>

pkgname=vim-trinity
pkgver=1.5
_scriptid=11988
pkgrel=6
pkgdesc="Build the trinity of srcexpl, taglist, NERD_tree to be a good IDE"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2347"
license=('custom')
depends=(vim vim-srcexpl vim-taglist vim-nerdtree)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('92992a6af74bd666885daf33d0eb8376'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/trinity.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/trinity.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

