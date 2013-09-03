# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-info
pkgver=1.7
_scriptid=1516
pkgrel=2
pkgdesc="GNU info documentation browser"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=21"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("info.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('89e7e4b25b565febb7491079e11d46e2'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles/plugin}
    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" info.vim
    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
    
}
