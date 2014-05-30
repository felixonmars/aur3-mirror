pkgname=vim-unite-outline
_gitcommit=27c83e5
pkgver=20140527
pkgrel=1
pkgdesc="Unite source for outlines"
arch=('any')
url="https://github.com/Shougo/unite-outline"
license=('MIT')
depends=('vim-unite')
groups=('vim-plugins')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/Shougo/unite-outline/tarball/$_gitcommit")
sha1sums=('06a165c5405ea24f1feaed0a159dc5de1015b3ca')

package() {
	cd "$srcdir/Shougo-unite-outline-$_gitcommit"

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -d $installpath/autoload/unite/{filters,sources}
	install -d $installpath/autoload/unite/sources/outline/{defaults,misc,modules}
	install -d $installpath/autoload/unite/sources/outline/defaults/ruby
	install -Dm644 autoload/unite/filters/* $installpath/autoload/unite/filters/
	install -Dm644 autoload/unite/sources/outline.vim $installpath/autoload/unite/sources/outline.vim
	install -Dm644 autoload/unite/sources/outline/util.vim $installpath/autoload/unite/sources/outline/util.vim
	install -Dm644 autoload/unite/sources/outline/defaults/*.vim $installpath/autoload/unite/sources/outline/defaults/
	install -Dm644 autoload/unite/sources/outline/defaults/ruby/* $installpath/autoload/unite/sources/outline/defaults/ruby/
	install -Dm644 autoload/unite/sources/outline/misc/* $installpath/autoload/unite/sources/outline/misc/
	install -Dm644 autoload/unite/sources/outline/modules/* $installpath/autoload/unite/sources/outline/modules/
	install -Dm644 doc/unite-outline.txt $installpath/doc/unite-outline.txt
}
