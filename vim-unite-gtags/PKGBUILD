pkgname=vim-unite-gtags
pkgver=20150315
_gitcommit=0031b7a
pkgrel=1
pkgdesc="Unite source for GNU global"
arch=('any')
url="https://github.com/hewes/unite-gtags"
license=('MIT')
depends=('vim-unite' 'global>=5.7')
groups=('vim-plugins')
install=vimdoc.install
source=("https://github.com/hewes/unite-gtags/")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/hewes/unite-gtags/tarball/$_gitcommit")
sha1sums=('ee1192dde24c75367e0b19786d12bfef8b9bae8f')

package() {
	cd "$srcdir/hewes-unite-gtags-$_gitcommit"
	installpath="$pkgdir/usr/share/vim/vimfiles"
	install -d "$installpath"/autoload/unite/{filters,kinds,libs,sources}
	install -Dm644 autoload/unite/filters/gtags_tree_matcher.vim "$installpath"/autoload/unite/filters/gtags_tree_matcher.vim
	install -Dm644 autoload/unite/kinds/gtags_completion.vim "$installpath"/autoload/unite/kinds/gtags_completion.vim
	install -Dm644 autoload/unite/libs/gtags.vim "$installpath"/autoload/unite/libs/gtags.vim
	install -Dm644 autoload/unite/sources/gtags.vim "$installpath"/autoload/unite/sources/gtags.vim
	install -Dm644 plugin/gtags.vim "$installpath"/plugin/gtags.vim
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vim-unite-gtags/LICENSE
}
