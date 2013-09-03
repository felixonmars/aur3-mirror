# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi2 at gmail com>

pkgname=vim-zoomwin
pkgver=25i
pkgrel=1
pkgdesc="Zoom in/out  of windows (toggle between one window and multi-window)"
arch=('any')
url="http://www.drchip.org/astronaut/vim/index.html#ZOOMWIN"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("http://www.drchip.org/astronaut/vim/vbafiles/ZoomWin.vba.gz"
        "license.txt")
md5sums=('e48bf78e3de22cc527d457e173bffded'
         'efbd5986e691ce8c876fb86e8f5961ea')

prepare () { 

    cd "$srcdir"

    vim -c ":UseVimball ./" -c ":qa!" ZoomWin.vba

}

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles{/doc,/plugin,/autoload}}

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/doc" doc/ZoomWin.txt

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/ZoomWinPlugin.vim

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/autoload" autoload/ZoomWin.vim

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

}

