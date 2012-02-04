# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
 
pkgname=carokann-git
pkgver=20100912
pkgrel=1
pkgdesc="Carokann chess library"
arch=('i686' 'x86_64')
url="http://carokann.homelinux.org/carokann"
license=('GPL3')
depends=('libgee' 'librsvg')
makedepends=('git' 'vala')

_gitroot="http://carokann.homelinux.org/git/carokann"
_gitname="carokann"

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

  sh autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
