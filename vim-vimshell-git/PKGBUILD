# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=vim-vimshell-git
pkgver=20120531
pkgrel=2
pkgdesc="powerful shell implemented by vim"
arch=(any)
url="https://github.com/Shougo/vimshell"
license=('GPL')
groups=()
depends=(vim vim-vimproc-git)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vimdoc.install

_gitroot=git://github.com/Shougo/vimshell.git
_gitname=vimshell

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
  find autoload doc ftplugin plugin syntax -type f \
    -exec install -D {} ${pkgdir}/usr/share/vim/vimfiles/{} \;
}

# vim:set ts=2 sw=2 et:
