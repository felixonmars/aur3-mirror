pkgname=vim-ag
pkgver=20150517
_gitcommit=e70862d
pkgrel=1
pkgdesc="Vim plugin for the_silver_searcher"
arch=('any')
url="https://github.com/rking/ag.vim"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim>=7.0' 'the_silver_searcher')
install=vimdoc.install
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/rking/ag.vim/tarball/$_gitcommit"
        LICENSE)
sha1sums=('5b489288677f036d88d5c45124cc571e233384cb'
          'be741035a33a75861fa14fcbd634d4174912c540')

package() {
	cd "$srcdir/rking-ag.vim-$_gitcommit"
	installpath="$pkgdir/usr/share/vim/vimfiles"
	install -Dm644 autoload/ag.vim "$installpath"/autoload/ag.vim
	install -Dm644 doc/ag.txt "$installpath"/doc/ag.txt
	install -Dm644 plugin/ag.vim "$installpath"/plugin/ag.vim
	install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
