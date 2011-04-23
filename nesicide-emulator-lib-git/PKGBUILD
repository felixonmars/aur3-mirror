# Maintainer: Franco Tortoriello <franco.tortoriello@gmail.com>

pkgname=nesicide-emulator-lib-git
pkgver=20110422
pkgrel=1
pkgdesc="Provides the NESICIDE emulation core as a library interface"
arch=('i686' 'x86_64')
url="http://www.nesicide.com"
license=('custom')
depends=()
makedepends=('git')
provides=()
conflicts=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://gitorious.org/nesicide/nesicide-emulator-lib.git"
_gitname="nesicide-emulator-lib"

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

  mkdir m4	# build workaround
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
