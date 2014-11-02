# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gitname=neomru.vim
_gitbranch=master
pkgname=vim-neomru-git
pkgver=53.e562f15
pkgrel=1
pkgdesc="Vim plugin to manage Most Recently Used (MRU) files. Integrated with Unite plugin."
arch=('any')
url="https://github.com/Shougo/neomru.vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("${_gitname}::git://github.com/Shougo/${_gitname}.git#branch=${_gitbranch}")
sha512sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

package() {
	cd "$srcdir/$_gitname"
	install -m 644 -D "plugin/neomru.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/neomru.vim"
	install -m 644 -D "doc/neomru.txt" "${pkgdir}/usr/share/vim/vimfiles/doc/neomru.txt"
	install -m 644 -D "autoload/neomru.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/neomru.vim"
	install -m 644 -D "autoload/unite/sources/mru.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/unite/sources/mru.vim"
	install -m 644 -D "autoload/unite/sources/neomru.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/unite/sources/neomru.vim"
}

# vim:set ts=2 sw=2 et:
