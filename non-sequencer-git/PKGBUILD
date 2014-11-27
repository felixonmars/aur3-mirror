# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: nareto <rennabh@gmail.com>

pkgname=non-sequencer-git
pkgver=r1792.e230929
pkgrel=2
pkgdesc="A powerful, lightweight, real-time, pattern-based MIDI sequencer"
arch=("i686" "x86_64")
url="http://non.tuxfamily.org/wiki/index.php?page=Non%20Sequencer"
license=("GPL2")
depends=("ntk-git" "libsigc++2.0" "jack" "liblo")
makedepends=("git")
provides=("non-sequencer-git")
conflicts=("non-sequencer" "non-sequencer-git")
options=()

_gitroot="git://git.tuxfamily.org/gitroot/non/non.git"
_gitname="non-sequencer-git"

pkgver() {
  cd "$srcdir/$_gitname-build/"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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
  cd "$srcdir/$_gitname-build/"

  ./waf configure --prefix=/usr --project=sequencer
  ./waf
}

package() {
  cd "$srcdir/$_gitname-build"
  ./waf --destdir="$pkgdir" install
}
