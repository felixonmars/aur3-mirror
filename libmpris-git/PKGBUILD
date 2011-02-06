# Contributor: Jorge Villaseñor <salinasv at gmail dot com>
pkgname=libmpris-git
pkgver=20090602
pkgrel=1
pkgdesc="C library that wraps the low level dbus C API to provide a way to remote-control media players that implement mpris"
arch=('i686')
url="http://github.com/salinasv/libmpris"
license=('GPL')
groups=()
depends=('dbus-core')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/salinasv/libmpris.git"
_gitname="libmpris"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
