# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-cref
_realname=crefvim
pkgver=1.0.4
_scriptid=3666
pkgrel=3
pkgdesc="C-reference manual especially designed for Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=614"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('8c25c4c6057dd5e24df48a996c64875a'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {
    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles{/doc,/after/syntax,/plugin}}

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

    cd "$srcdir/$_realname"

    for files in $(find $srcdir/$_realname/doc -name '*.txt' -print)
    do
	install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/doc" $files
    done

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/$_realname.vim

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/after/syntax" after/syntax/help.vim

}

