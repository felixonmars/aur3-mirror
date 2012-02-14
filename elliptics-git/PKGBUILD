# Maintainer: Yanchenko Igor <yanchenko.igor@gmail.com>
pkgname=elliptics-git
pkgver=20120214
pkgrel=1
pkgdesc="A new DHT implementation from the author of the in-kernel distributed filesystem POHMELFS"
arch=('i686' 'x86_64')
url="http://ioremap.net/projects/elliptics"
license=('GPL')
makedepends=('make' 'gcc' 'git' 'autoconf' 'automake')
optdepends=('fcgi' 'tokyotyrant' 'libatomic' 'db')

_gitroot=http://www.ioremap.net/git/elliptics.git
_gitname=elliptics.ġit

build() {
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  export LDFLAGS="${LDFLAGS//--as-needed}"
  msg "this package can use 'fcgi', 'tokyotyrant', 'libatomic' and 'db'"
  msg "If your build fails with
'../library/.libs/libdnet.so: undefined reference to __sync_sub_and_fetch_4'
you should install libatomic, as your architecture doesn't support atomic operations out of the box"
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
  ./autogen.sh
  env PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
