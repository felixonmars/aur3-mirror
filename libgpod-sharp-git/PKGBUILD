#Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>

pkgname=libgpod-sharp-git
pkgver=20100827
pkgrel=3
pkgdesc="Library to access the contents of an iPod"
arch=('i686' 'x86_64')
url="http://gtkpod.git.sourceforge.net"
license=('LGPL')
depends=('mono' 'gtk-doc' 'libplist')
makedepends=('git')
provides=('libgpod-sharp' 'libgpod-sharp-git')
conflicts=('libgpod' 'libgpod-git')
replaces=('libgpod')

_gitroot="git://gtkpod.git.sourceforge.net/gitroot/gtkpod/libgpod"
_gitname="libgpod"

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


  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  rmdir $pkgdir/tmp
}
