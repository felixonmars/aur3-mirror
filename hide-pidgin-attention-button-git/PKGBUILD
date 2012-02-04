# Maintainer: Ngoc Nguyen Bao <baongoc124@gmail.com>
pkgname=hide-pidgin-attention-button-git
pkgver=20110329
pkgrel=1
pkgdesc="Pidgin Plugin - Hide Pidgin Attention Button"
arch=('i686' 'x86_64')
url="https://github.com/soomsoom/Hide-Pidgin-Attention-Button"
license=('GPL')
depends=(freetype2 cairo libpurple gtk2)
makedepends=('git')
md5sums=()

_gitroot="https://github.com/soomsoom/Hide-Pidgin-Attention-Button"
_gitname="Hide-Pidgin-Attention-Button"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
