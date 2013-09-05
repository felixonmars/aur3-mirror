# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-mines
pkgver=20
pkgrel=1
pkgdesc="Play Mines with vim"
arch=('any')
url="http://www.drchip.org/astronaut/vim/index.html#MINES"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("http://www.drchip.org/astronaut/vim/vbafiles/Mines.vba.gz"
        "license.txt")
md5sums=('38076048d72c3c5160b0ded108e7b009'
         'efbd5986e691ce8c876fb86e8f5961ea')

prepare () {

    cd "$srcdir"

    vim -c ":UseVimball ./" -c ":qa!" Mines.vba
}


package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/licenses/$pkgname,/vim/vimfiles{/doc,/plugin,/autoload}}

    install -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/doc" doc/Mines.txt

    for files in $(find plugin -name '*.vim' -print)
    do
	install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" $files

    done

    install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/autoload" autoload/Mines.vim
}

