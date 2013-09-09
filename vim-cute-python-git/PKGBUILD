# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_name=vim-cute-python
pkgname=${_name}-git
pkgver=25.313a810
pkgrel=1
pkgdesc="Unicode goodness for Python code by using vim's 'conceal' feature"
arch=('any')
url="https://github.com/ehamberg/vim-cute-python"
license=('unknown')
depends=('vim')
makedepends=('git')
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/ehamberg/vim-cute-python
_gitname=cute

pkgver() {
  cd "$srcdir/$_gitname-build"
  echo $(git rev-list --count HEAD ).$(git rev-parse --short HEAD )
}

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
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm644 after/syntax/python.vim ${pkgdir}/usr/share/vim/vimfiles/after/syntax/python.vim
}

# vim:set ts=2 sw=2 et:
