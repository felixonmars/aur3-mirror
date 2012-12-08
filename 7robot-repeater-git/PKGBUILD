# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=7robot-repeater-git
pkgver=20121207
pkgrel=1
pkgdesc="7Robot virtual STCP server"
arch=('i686' 'x86_64')
url="http://github.com/bouttier/Repeater/"
license=('GPL')
depends=()
makedepends=('git')
conflicts=("7-robot-repeater")
provides=("7-robot-repeater")

_gitroot=http://github.com/bouttier/Repeater.git
_gitname=Repeater

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

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DARCHLINUX:Boolean=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}
