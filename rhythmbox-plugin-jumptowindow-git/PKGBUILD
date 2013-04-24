# Maintainer: H.Gökhan Sarı <me@th0th.me>
pkgname=rhythmbox-plugin-jumptowindow-git
pkgver=VERSION
pkgrel=1
pkgdesc="JumpToWindow is a Rhythmbox plugin which shows a 'Jump to' window when a certain hotkey is pressed."
arch=('any')
url="https://github.com/bkueng/JumpToWindow"
license=('GPL')
depends=('rhythmbox' 'python2')
makedepends=('git')
install='rhythmbox-jumptowindow.install'

_gitroot=https://github.com/bkueng/JumpToWindow.git
_gitname=master

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
  # no building is necessary, leaving in-case of a future-need
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_DIR="$pkgdir/usr/lib/rhythmbox/plugins/JumpToWindow" install
}

# vim:set ts=2 sw=2 et:
