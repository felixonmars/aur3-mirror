# Maintainer: Martin Stenberg <bumbyn@gmail.com>

pkgname=strfip
pkgver=20111227
pkgrel=1
pkgdesc='Print formated IP address information'
arch=('i686' 'x86_64')
url='http://github.com/bumby/strfip'
license=('GPL')
depends=()
makedepends=('git')
conflicts=()
provides=('strfip')

_gitroot='http://github.com/bumby/strfip.git'
_gitname='strfip'

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
