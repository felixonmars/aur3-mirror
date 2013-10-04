# Maintainer: Martin Stenberg <martin@xinxidi.net>

pkgname=xkeymultiplexer
pkgver=20131004
pkgrel=1
pkgdesc='Send keystrokes to multiple X11 windows'
arch=('i686' 'x86_64')
url='http://github.com/bumby/xkeymultiplexer'
license=('GPL')
depends=('libx11')
makedepends=('git')
conflicts=()
provides=('xkeymultiplexer')

_gitroot='http://github.com/bumby/xkeymultiplexer.git'
_gitname='xkeymultiplexer'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install
}
