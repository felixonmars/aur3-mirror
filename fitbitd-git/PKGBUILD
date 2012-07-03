# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=fitbitd-git
pkgver=20120703
pkgrel=1
pkgdesc="A FitBit synchronisation daemon"
arch=('i686' 'x86_64')
url="http://www.paulburton.eu/projects/fitbitd"
license=('GPL')
depends=('mxml' 'curl' 'dbus' 'libusbx')
makedepends=('git')
options=()
source=()

_gitroot="http://paulburton.eu/git/fitbitd.git"
_gitname="fitbitd"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/usr" install

  # udev rule
  install -Dm644  51-fitbit.rules "$pkgdir/usr/lib/udev/rules.d/51-fitbit.rules"
}

# vim:set ts=2 sw=2 et:
