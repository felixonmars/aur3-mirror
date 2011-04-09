# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=dfbterm-git
pkgver=20110409
pkgrel=1
pkgdesc="Terminal emulator for directfb. Git version"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('lite')
makedepends=('git')
provides=('dfbterm')
conflicts=('dfbterm')

_gitroot="git://git.directfb.org/git/directfb/programs/DFBTerm.git"
_gitname="dfbterm"

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
