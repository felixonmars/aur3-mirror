# Maintainer: Élie Bouttier <cube.elie@gmail.com>
pkgname=7robot-can-git
pkgver=20120212
pkgrel=1
pkgdesc="7Robot can tools"
arch=('i686' 'x86_64')
url="http://github.com/bouttier/Can/"
license=('GPL')
depends=()
makedepends=('git')

_gitroot=http://github.com/bouttier/Can.git
_gitname=Can

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

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}
