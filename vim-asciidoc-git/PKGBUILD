
# Maintainer: thriqon <aur@jonasw.de>
pkgname=vim-asciidoc-git
pkgver=20121126
pkgrel=1
pkgdesc="AsciiDoc Syntax Plugin for vim"
arch=('any')
url="https://github.com/dagwieers/asciidoc-vim"
license=('GPL')
depends=('vim')
makedepends=('git')

_gitroot=git://github.com/dagwieers/asciidoc-vim.git
_gitname=asciidoc-vim

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  SYNTAXDIR=/usr/share/vim/vimfiles/syntax/
  mkdir -p $pkgdir/$SYNTAXDIR
  install asciidoc.vim $pkgdir/$SYNTAXDIR/asciidoc.vim
}

# vim:set ts=2 sw=2 et:
