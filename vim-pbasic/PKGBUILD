# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-pbasic
pkgver=1.2
_scriptid=11584
pkgrel=1
pkgdesc="syntax file for PBASIC 2.5; should work with older versions as well"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2649"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("pbasic.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('30f937af6621fb24ac8aed08726fb9ad'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles/syntax}

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" pbasic.vim


}
