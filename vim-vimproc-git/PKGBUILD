# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=vim-vimproc-git
pkgver=20120329
pkgrel=1
pkgdesc="interactive command execution in vim"
arch=(i686 x86_64)
url="https://github.com/Shougo/vimproc"
license=('MIT')
groups=()
depends=(vim)
makedepends=('git')
provides=(vim-vimproc)
conflicts=(vim-vimproc)
replaces=()
backup=()
options=()
install=vimdoc.install

_gitroot=https://github.com/Shougo/vimproc.git
_gitname=vimproc

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

  #
  # BUILD HERE
  #
  make -f make_unix.mak || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  for f in autoload/vimproc_unix.so autoload/vimproc.vim autoload/vimproc/* \
           doc/* plugin/* ; do
    install -D $f ${pkgdir}/usr/share/vim/vimfiles/$f
  done
}

# vim:set ts=2 sw=2 et:
