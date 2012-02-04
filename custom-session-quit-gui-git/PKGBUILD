# Maintainer: Alex Charron <undeterminant@gmail.com>
pkgname=custom-session-quit-gui-git
pkgver=20120101
pkgrel=1
pkgdesc="GUI for ending a custom user session."
arch=('i686' 'x86_64')
url="https://github.com/Undeterminant/custom-session-quit"
license=('unknown')
depends=('custom-session-quit-git' 'gtkmm3')
makedepends=('gtkmm3' 'git')

_gitroot="https://github.com/Undeterminant/custom-session-quit.git"
_gitname="custom-session-quit"

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

  make
}

package_custom-session-quit-gui-git() {
  cd "$srcdir/$_gitname-build/custom-session-quit-gui"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
