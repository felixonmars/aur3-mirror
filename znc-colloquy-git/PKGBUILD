# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=znc-colloquy-git
pkgver=20130118
pkgrel=1
pkgdesc="Colloquy push notification for ZNC"
arch=('i686' 'x86_64')
url="https://github.com/wired/colloquypush"
license=('GPL')
depends=('znc')
makedepends=('git')

_gitroot=https://github.com/wired/colloquypush.git
_gitname=colloquypush

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

  cd "$srcdir/$_gitname-build/znc"
  znc-buildmod colloquy.cpp
}

package() {
  cd "$srcdir/$_gitname-build/znc"
  install -Dm755 colloquy.so "$pkgdir/usr/lib/znc/colloquy.so"
}

# vim:set ts=2 sw=2 et:
