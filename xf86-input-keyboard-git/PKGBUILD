# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=xf86-input-keyboard-git
pkgver=20121207
pkgrel=1
pkgdesc="X.org keyboard input driver (git version)"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org"
license=('GPL')
makedepends=('git' 'xorg-server-git')
provides=('xf86-input-keyboard')
conflicts=('xf86-input-keyboard')

_gitroot="git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard"
_gitname="xf86-input-keyboard"

build() {
  msg "Connecting to git.freedesktop.org GIT server...."

  if [[ -d "$_gitname" ]] ; then
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

  ./autogen.sh
  make
}

package() {
  make -C "$srcdir/$_gitname-build" PREFIX=/usr DESTDIR="$pkgdir" install
}
