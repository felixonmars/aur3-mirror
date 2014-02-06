pkgname=vim-vimfiler
pkgver=4.0
_gitcommit=a8c4bae
pkgrel=1
pkgdesc="Powerful file explorer in vim script"
arch=('any')
url="https://github.com/Shougo/vimfiler.vim"
license=('MIT')
depends=('vim-unite>=3.0')
optdepends=('gvim: for python interface to support larger files'
            'vim-vimproc: for various vimfiler commands')
groups=('vim-plugins')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/Shougo/vimfiler.vim/tarball/$_gitcommit")
sha1sums=('fe3cbbca8cc6d077c7de6cb21c2085adc051bc47')

package() {
	cd "$srcdir/Shougo-vimfiler.vim-$_gitcommit"

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -d $installpath/{autoload/vimfiler/columns,syntax}
	install -d $installpath/autoload/unite/{filters,sources}
	install -d $installpath/autoload/vital/_5de2c28/{Data,System,Vim}
	install -Dm644 autoload/vimfiler.vim $installpath/autoload/vimfiler.vim
	install -Dm644 autoload/unite/filters/* $installpath/autoload/unite/filters/
	install -Dm644 autoload/unite/sources/* $installpath/autoload/unite/sources/
	install -Dm644 autoload/vimfiler/*.vim $installpath/autoload/vimfiler/
	install -Dm644 autoload/vimfiler/columns/* $installpath/autoload/vimfiler/columns/
	install -Dm644 autoload/vital/*.vi* $installpath/autoload/vital/
	install -Dm644 autoload/vital/_5de2c28/*.vim $installpath/autoload/vital/_5de2c28/
	install -Dm644 autoload/vital/_5de2c28/Data/* $installpath/autoload/vital/_5de2c28/Data/
	install -Dm644 autoload/vital/_5de2c28/System/* $installpath/autoload/vital/_5de2c28/System/
	install -Dm644 autoload/vital/_5de2c28/Vim/* $installpath/autoload/vital/_5de2c28/Vim/
	install -Dm644 doc/vimfiler.txt $installpath/doc/vimfiler.txt
	install -Dm644 plugin/vimfiler.vim $installpath/plugin/vimfiler.vim
	install -Dm644 syntax/* $installpath/syntax/
}
