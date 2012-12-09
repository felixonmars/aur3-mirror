# Contributor: Kamil Stachowski <kamil.stachowski@at@gmail.com>

pkgname=snipmate.vim
pkgver=20121209
pkgrel=1
pkgdesc="TextMate's snippets features in Vim"
url="https://github.com/msanders/snipmate.vim"
arch=('i686' 'x86_64')
license=('MIT')
depends=('vim>=7.0')
makedepends=('')
groups=('vim-plugins')
provides=('vim-snipmate')
conflicts=()
replaces=()
# source=('http://www.vim.org/scripts/download_script.php?src_id=11006')
# md5sums=('9bf94595c3fca7974559877ccff1938e')
# ms5sums=()

_gitroot='git://github.com/msanders/snipmate.vim.git'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$pkgname" ]; then
		cd "$srcdir/$pkgname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"

	mkdir -p "$pkgdir/usr/share/vim/vimfiles"
	for i in `ls "$srcdir/$pkgname/"`; do
		cp -R "$srcdir/$pkgname/$i" "$pkgdir/usr/share/vim/vimfiles/"
	done
	rm -rf "$pkgdir/usr/share/vim/vimfiles/plugin-info.txt"
	rm -rf "$pkgdir/usr/share/vim/vimfiles/README.markdown"
}
