# Maintainer:  Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-foo
pkgver=2.1.1
_scriptid=4837
pkgrel=3
pkgdesc="Examples of Vim functions (and a few commands, etc.)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=72"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("foo.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('426a980cc659c4f344e84c67d1515948'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles/plugin}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" foo.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

}

