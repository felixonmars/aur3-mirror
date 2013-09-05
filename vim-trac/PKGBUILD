# Maintainer: 
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi2 at gmail com>

pkgname=vim-trac
pkgver=0.3.6
_scriptid=11431
_vimver=74
pkgrel=2
pkgdesc="A vim client for the Trac wiki and ticketing system"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2147"
license=('custom')
depends=('vim' 'vim-align')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        "license.txt")
md5sums=('44159aa7e7fc3e4d6ec8b6130e411cf5'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {
    
    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim{/vim74/plugin,/vimfiles{/doc,/plugin}}}

    for files in $(find $srcdir/doc -name '*.txt' -print)
    do
	install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/doc" \
	    $files
    done

    for files in $(find $srcdir/plugin -name '*.vim' -print)
    do
	install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" \
	    $files
    done

    for files in $(find $srcdir/plugin -name '*.py' -print)
    do
	install -m 644 -t "$pkgdir/usr/share/vim/vim$_vimver/plugin" \
	    $files
    done

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
	

}

