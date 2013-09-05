# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor lang2

pkgname=vim-lustyexplorer
pkgver=4.3
_srcid=17529
_vimfile=lusty-explorer.vim
pkgrel=2
pkgdesc="Dynamic filesystem and buffer explorer."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1890"
depends=('vim')
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
source=("$_vimfile::http://www.vim.org/scripts/download_script.php?src_id=$_srcid"
        "license.txt")
md5sums=('eaff3e84d318bba64741b00e68ec7fd4'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles/plugin}

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" $_vimfile

}

