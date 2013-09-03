# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Mizuchi <ytj000@gmail.com>
#
#

pkgname=vim-autocorrect
pkgver=1.03
pkgrel=2
pkgdesc="Correct common typos and misspellings as you type"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2429"
license=('unknown')
groups=('vim-plugins')
depends=('vim')
source=("autocorrect.tar::http://vim.sourceforge.net/scripts/download_script.php?src_id=10423")
md5sums=('58e01b3a9d6430a86ac2297c9f7dfadb')

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/plugin,/doc/$pkgname}
    
    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" autocorrect.vim

    install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" README

}

