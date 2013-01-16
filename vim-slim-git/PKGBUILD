# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=vim-slim-git
pkgver=20130111
pkgrel=1
pkgdesc="Slim template language syntax support for Vim."
arch=('any')
url="https://github.com/slim-template/vim-slim"
license=('MIT')
depends=('vim')
optdepends=('vim-coffeescript')
makedepends=('git')
provides=('vim-slim')
conflicts=('vim-slim')

_gitroot="https://github.com/slim-template/vim-slim.git"
_gitname="vim-slim"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"

  install -D -m644 syntax/slim.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/slim.vim"
  install -D -m644 ftdetect/slim.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect/slim.vim"
} 
