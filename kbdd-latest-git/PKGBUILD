# Maintainer: Ilya Makarov <zveroy@gmail.com>
pkgname=kbdd-latest-git
pkgver=228.32fe294
pkgrel=1
pkgdesc="Simple daemon to make per window keyboard layout"
arch=('i686' 'x86_64')
url="https://github.com/qnikst/kbdd"
license=('GPL3')
makedepends=('git' 'autoconf')
provides=('kbdd')
conflicts=('kbdd' 'kbdd-git')

_gitroot="git://github.com/qnikst/kbdd.git"
_gitname=kbdd

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
  aclocal
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# vim:set ts=2 sw=2 et:
