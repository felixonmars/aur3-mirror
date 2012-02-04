# Maintainer: Alex Merry <dev@randomguy3.me.uk>
pkgname=kscreenlockmgr-git
pkgver=20110903
pkgrel=1
pkgdesc="A hack to make screen locking work when using Plasma Netbook"
arch=(i686 x86_64)
url="http://randomguy3.wordpress.com/2011/09/04/screen-locking-with-the-plasma-netbook-interface/"
license=('GPL')
groups=()
depends=('kdelibs' 'libxext' 'libxss')
makedepends=('git' 'automoc4' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=git://anongit.kde.org/scratch/alexmerry/kscreenlockmgr
_gitname=kscreenlockmgr

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cmake ../kscreenlockmgr -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
