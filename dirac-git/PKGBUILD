# Maintainer: Nezmer <Nezmer@gmail.com>
pkgname=dirac-git
pkgver=20090329
pkgrel=1
pkgdesc="Dirac video codec 'development branch'"
arch=('i686' 'x86_64')
url="http://www.diracvideo.org"
depends=('perl' 'cppunit')
makedepends=('doxygen' 'git')
provides=('dirac')
conflicts=('dirac')
replaces=('dirac')
license=('MPL')
source=()
md5sums=()

_gitroot="git://diracvideo.org/git/dirac-research.git"
_gitname="dirac-research"

build() {

  cd "$srcdir"
  msg "Connecting to the dirac git repository..."

  if [ -d "$srcdir/$_gitname" ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  ./bootstrap || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
