# Maintainer: Alexej Magura <agm2819*gmail*>
# Maintainer: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-errsign
pkgver=0.1
_scriptid=3213
pkgrel=3
pkgdesc="Vim plugin: display marks on lines with errors"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1027"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(errsign.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('ab7d4acf0d3335d4e5f49f6bc5b929c3'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/plugin,/licenses/$pkgname}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" \
	errsign.vim
    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" \
	license.txt
}

