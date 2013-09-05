# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-mips
pkgver=1.0.1
_scriptid=7826
pkgrel=3
pkgdesc="MIPS syntax highlighting for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2045"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("mips.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('f769e2c19ba9d3039c5deb7775fbc8ab'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {
    
    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/syntax,/licenses/$pkgname}
    
    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" mips.vim 

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
