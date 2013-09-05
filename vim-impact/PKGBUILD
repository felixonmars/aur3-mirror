# Maintainer:  Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-impact
pkgver=0.2
_scriptid=4597
pkgrel=2
pkgdesc="a nice dark colorscheme for term/cterm only"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1326"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("impact.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('82326557b6825ffa621c6923822d27c2'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/colors,/licenses/$pkgname}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/colors" impact.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
