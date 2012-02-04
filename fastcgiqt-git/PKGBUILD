# Contributor: Martin Sandsmark <sandsmark@samfundet.no>
pkgname=fastcgiqt-git
pkgver=20091205
pkgrel=1
pkgdesc="C++ FastCGI library based on QtCore"
arch=('x86_64' 'i686')
url="http://gitorious.org/fastcgiqt"
license=('GPL')
groups=('ISC')
depends=('qt')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://gitorious.org/fastcgiqt/fastcgiqt.git"
_gitname="fastcgiqt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
