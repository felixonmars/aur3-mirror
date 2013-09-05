# Maintainer:  Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-emacs
pkgver=20010816
_scriptid=117
pkgrel=3
pkgdesc="Emacs like colors"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=63"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("emacs.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('0a6171f1e906fdc7b168faaca00353ce'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/colors,/licenses/$pkgname} 

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/colors" emacs.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

}
