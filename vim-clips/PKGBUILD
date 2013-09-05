# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-clips
pkgver=0.3
_scriptid=10709
pkgrel=1
epoch=1
pkgdesc="Syntax highlighting for CLIPS"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2660"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("clips.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('289b841a550662d7ce8798d0cfd06675'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {
    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/vim/vimfiles/syntax,/licenses/$pkgname}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" clips.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
