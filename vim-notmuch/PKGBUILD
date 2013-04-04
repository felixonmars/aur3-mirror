# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=vim-notmuch
pkgver=0.5
pkgrel=1
pkgdesc='Plug-in for vim to use notmuch'
arch=('any')
url='http://github.com/felipec/notmuch-vim-ruby'
license=('GPL')
depends=('vim' 'notmuch')
optdepends=('ruby-mail')
groups=('vim-plugins')
source=(http://github.com/felipec/notmuch-vim-ruby/archive/v0.5.tar.gz)
sha1sums=('80e9a7e3d4cf898271b5c3420a8fa59649774063')

package() {
	cd "$srcdir/notmuch-vim-ruby-$pkgver"

	# make install DESTDIR="$pkgdir" prefix="/usr/share/vim/vimfiles"
	install -v -D -m644 notmuch-ruby.vim "$pkgdir/usr/share/vim/vimfiles/plugin/notmuch-ruby.vim"
}
