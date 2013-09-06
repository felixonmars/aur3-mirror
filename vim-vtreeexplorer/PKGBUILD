# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Daniele Paolella <dp@hostess-promoter.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-vtreeexplorer
pkgver=1.28
_scriptid=8097
pkgrel=3
pkgdesc="Tree based file explorer - the original"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=184"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
changelog=ChangeLog
source=("vtreeexplorer-$pkgver.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('c728d236dc31c03acf5aaf2e8a05fad3'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd "$srcdir" 

    install -d "$pkgdir"/usr/share{/vim/vimfiles{/doc,/plugin},/licenses/$pkgname}

    for files in $(find "$srcdir"/doc -name '*.txt' -print)
    do
	install -m 644 -t "$pkgdir"/usr/share/vim/vimfiles/doc $files
    done

    for files in $(find "$srcdir"/plugin -name '*.vim' -print)
    do 
	install -m 644 -t "$pkgdir"/usr/share/vim/vimfiles/plugin $files
    done

    install -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname license.txt
    
}
