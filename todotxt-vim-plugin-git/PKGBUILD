# Maintainer: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=todotxt-vim-plugin-git
pkgver=r48.5a2eb56
pkgrel=1
pkgdesc="Vim plugin for Todo.txt"
arch=('i686' 'x86_64')
url="https://github.com/freitass/todo.txt-vim"
license=('custom')
groups=()
depends=('vim')
makedepends=()
optdepends=()
provides=()
conflicts=('todotxt-vim-plugin')
replaces=()
backup=()
options=()
install=
changelog=
source=('todotxt-vim::git://github.com/freitass/todo.txt-vim')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/todotxt-vim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#
#}

package() {
  local installpath="$pkgdir/usr/share/vim/vimfiles"
  cd "$srcdir/todotxt-vim"

  install -Dm644 doc/todo.txt "$installpath/doc/todo.txt"
  install -Dm644 ftdetect/todo.vim "$installpath/ftdetect/todo.vim"
  install -Dm644 ftplugin/todo.vim "$installpath/ftplugin/todo.vim"
  install -Dm644 syntax/todo.vim "$installpath/syntax/todo.vim"
}
