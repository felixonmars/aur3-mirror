# Maintainer: SpepS <dreamspepser at yahoo dot it>

_p=libsoupmm
pkgname=$_p-git
pkgver=20110723
pkgrel=1
pkgdesc="C++ bindings for libsoup"
arch=(i686 x86_64)
url="http://live.gnome.org/LibSoup"
license=('GPL')
depends=('glibmm' 'libsoup' 'libsigc++')
makedepends=('git' 'mm-common' 'doxygen')
provides=("$_p")
conflicts=("$_p")
options=('!libtool')

_gitroot="git://git.gnome.org/$_p"
_gitname="$_p"

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

  cd libsoup/src && make
  cd - && make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
