# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-favmenu
pkgver=0.33
_scriptid=19452
pkgrel=1
pkgdesc="A new menu, like IE's Favourites, or Netscape's Bookmark"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=161"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("FavMenu.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('1496c751b892e0dc9682b07f3e2b7389'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles/plugin}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" FavMenu.vim
    
    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
