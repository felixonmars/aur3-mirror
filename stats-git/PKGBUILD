# Maintainer: Daniel Oom <daoo314+aur@gmail.com>

pkgname=stats-git
pkgver=20130324
pkgrel=2
pkgdesc="Gather numbers in sequenced text"
arch=('i686' 'x86_64')
url="https://github.com/rustyrussell/stats"
license=(GPL3)
depends=(glibc)
makedepends=(git make gcc)

_gitroot="git://github.com/rustyrussell/stats.git"
_gitname="stats"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    git --git-dir="$_gitname/.git" pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  make install PREFIX="$pkgdir/usr"
}
