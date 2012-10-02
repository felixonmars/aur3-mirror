# Maintainer: Daniel Leining <daniel@the-beach.co>
pkgname=vim-autoclose-git
pkgver=20121002
pkgrel=1
pkgdesc="vim autoclose plugin"
arch=(any)
url="http://townk.github.com/vim-autoclose/"
license=('GPL')
groups=()
depends=(vim)
conflicts=(vim-autoclose)
makedepends=('git')
source=()

_gitroot=git://github.com/Townk/vim-autoclose.git
_gitname=vim-autoclose

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
}

package() {
  install -Dm644 ${srcdir}/$_gitname/plugin/AutoClose.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/AutoClose.vim
}

# vim:set ts=2 sw=2 et:
