# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=7robot-can-git
pkgver=20121207
pkgrel=1
pkgdesc="7Robot can tools"
arch=('any')
url="http://github.com/bouttier/Can/"
license=('GPL')
depends=()
makedepends=('git')
conflicts=('7robot-can')
provides=('7robot-can')

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}
