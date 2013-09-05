#
# Maintainer:  Alexej Magura <agm2819*gmail*>
#
# Contributor: Laszlo Papp <djszapi @ gmail at com>
#
#
pkgname=vim-actionscript
pkgver=0.3
_scriptid=10123
pkgrel=2
pkgdesc="ActionScript 3.0, 2.0, and 1.0 syntax file"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1061"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("actionscript.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('426f59df295bc3345a2592ba6805bad0'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir" 

    install -d "$pkgdir"/usr/share{/vim/vimfiles/syntax,/licenses/$pkgname}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" actionscript.vim
    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

}
