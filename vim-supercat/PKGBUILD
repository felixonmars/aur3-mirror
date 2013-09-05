# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-supercat
pkgver=1.1
_scriptid=10826
pkgrel=1
pkgdesc="Syntax for supercat configuration files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2676"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("supercat.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('5454d199674603d1644a8e1ecd7debe7'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/after/syntax,/licenses/$pkgname}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/after/syntax" supercat.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

}
