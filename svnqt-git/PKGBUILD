# Maintainer: Tim Besard <tim.besard@gmail.com>

pkgname=svnqt-git
pkgver=20110904
pkgrel=1
pkgdesc="svnqt is a Subversion library wrapped intended to provide easy access to Subversion facilities from Qt. It is extracted from the KDESvn."
arch=('i686' 'x86_64')
url="https://github.com/maleadt/svnqt"
license=('LGPL')
depends=('qt')
makedepends=('git' 'cmake')
provides=('svnqt')
conflicts=('svnqt')

_gitroot="git://github.com/MIRAvzw/svnqt.git"
_gitname="svnqt"

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
  
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 

