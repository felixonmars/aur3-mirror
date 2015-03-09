# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>
pkgname=pykep-git
pkgver=1.2.1
pkgrel=2
pkgdesc="scientific library providing basic tools for astrodynamics research"
arch=('i686' 'x86_64')
url="https://esa.github.io/pykep"
license=('GPL')
depends=('boost')
makedepends=('git' 'cmake')

_gitroot=https://github.com/esa/pykep.git
_gitname=pykep

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PYKEP=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
