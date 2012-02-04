# Maintainer: Alex Charron <undeterminant@gmail.com>
pkgname=custom-session-git
pkgver=20120101
pkgrel=1
pkgdesc="Tools for managing a custom user session."
arch=('any')
url="https://github.com/Undeterminant/custom-session"
license=('unknown')
depends=('python' 'consolekit')
makedepends=('git')
optdepends=('xorg-server: for the default session wrapper')
backup=('etc/custom-session-wrapper')

_gitroot="https://github.com/Undeterminant/custom-session.git"
_gitname="custom-session"

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
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
