# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=vim-narrow
pkgver=0.2.1
pkgrel=1
pkgdesc="Vim plugin to emulate Emacs' narrowing feature"
url="http://www.vim.org/scripts/script.php?script_id=2097"
arch=('i686' 'x86_64')
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
provides=('vim-narrow')
conflicts=()
replaces=()
source=()
md5sums=()

_gitroot='git://github.com/kana/vim-narrow'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$pkgname" ]; then
		cd "$srcdir/$pkgname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"
}

package() {
	for i in "autoload" "doc" "plugin"; do
		mkdir -p "$pkgdir/usr/share/vim/vimfiles/$i"
		cp -R "$srcdir/$pkgname/$i" "$pkgdir/usr/share/vim/vimfiles/"
	done
}
