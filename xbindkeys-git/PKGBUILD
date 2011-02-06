# Maintainer: Brian Mock <mock.brian@gmail.com>
pkgname=xbindkeys-git
pkgver=20101205
pkgrel=1
pkgdesc="Launch shell commands with your keyboard or your mouse under X"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('libx11' 'guile>=1.8.1' 'tk')
makedepends=('git')
conflicts=('xbindkeys')
provides=('xbindkeys')

_gitroot="git://git.savannah.nongnu.org/xbindkeys.git/"
_gitname="xbindkeys"

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

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
