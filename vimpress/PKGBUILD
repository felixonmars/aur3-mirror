pkgname=vimpress
pkgver=0.91
_scriptid=7348
pkgrel=1
pkgdesc="Manage wordpress blog posts from Vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1953"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(vimpress.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e9811ba93e7458176e2ab72b849dc88f'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/vimpress.vim ${pkgdir}/usr/share/vim/vim72/plugin/vimpress.vim
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
