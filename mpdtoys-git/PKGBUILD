# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=mpdtoys-git
pkgver=20090228
pkgrel=1
pkgdesc="A collection of CLI toys and tools for interacting with MPD"
arch=(i686 x86_64)
url="http://kitenet.net/~joey/code/mpdtoys/"
license=('GPL')
depends=(perl-audio-mpd)
makedepends=(git)
source=()
md5sums=()

_gitroot="git://git.kitenet.net/mpdtoys"
_gitname="mpdtoys"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make DESTDIR="$pkgdir/" install
}
