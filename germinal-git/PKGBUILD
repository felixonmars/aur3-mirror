# Maintainer: bobe
pkgname=germinal-git
pkgver=20130104
pkgrel=1
pkgdesc="Minimalist vte-based terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/Keruspe/Germinal"
license=('GPL')
depends=('glib2' 'gtk3' 'vte3' 'tmux')
makedepends=('git')
provides=('germinal')
conflicts=('germinal')

_gitroot="git://github.com/Keruspe/Germinal.git"
_gitname="Germinal"

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
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
