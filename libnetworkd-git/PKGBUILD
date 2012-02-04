# Maintainer: Michael P <ptchinster@archlinux.us>

pkgname=libnetworkd-git
pkgver=20111128
pkgrel=1
pkgdesc="generic library for rapid asynchronous C++ network daemon development"
arch=('i686' 'x86_64')
url="http://code.mwcollect.org/projects/libnetworkd/wiki"
license=('LGPL')
groups=()
depends=()
makedepends=('git' 'autoconf')
provides=('libnetworkd')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=http://git.mwcollect.org/libnetworkd.git
_gitname=libnetworkd

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
  autoreconf -vi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
