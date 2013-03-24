# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net> pointfree on irc.freenode.net
pkgname=ndndump-git
pkgver=20130324
pkgrel=1
pkgdesc="tcpdump for NDN/CCN (Named-Data Networking/Content-Centric Networking)"
arch=('i686' 'x86_64')
url="https://github.com/named-data/ndndump"
license=('GPL3')
groups=('ndn')
depends=()
makedepends=('git' 'python')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot=https://github.com/named-data/ndndump.git
_gitname=ndndump

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

  # BUILD HERE
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
