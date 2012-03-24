# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
pkgname=lthread-git
pkgver=20120324
pkgrel=1
pkgdesc="Multicore enabled coroutine library written in C."
arch=('i686' 'x86_64')
url="https://github.com/halayli/lthread"
license=('GPL2')
depends=()
makedepends=('git' 'gcc')
provides=('lthread')
conflicts=('lthread')

_gitroot=git://github.com/halayli/lthread.git
_gitname=lthread

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

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
