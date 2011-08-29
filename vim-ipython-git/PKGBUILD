# Maintainer: Emmanuel Gras <gras.emmanuel@gmail.com>

pkgname=vim-ipython-git
pkgver=20110829
pkgrel=1
pkgdesc="A two-way integration between Vim and IPython 0.11+ "
arch=('any')
url="https://github.com/ivanov/vim-ipython"
license=('GPL')
depends=('vim' 'ipython>=0.11' 'pyzmq-git')
makedepends=('git')
provides=('vim-ipython')
source=()
noextract=()

_gitroot=https://github.com/ivanov/vim-ipython
_gitname=vim-ipython

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
}

package() {
  cd "$srcdir/$_gitname"
  install -D ftplugin/python/ipy.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/python/ipy.vim

}

# vim:set ts=2 sw=2 et:
