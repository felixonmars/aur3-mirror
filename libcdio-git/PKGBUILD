pkgname=libcdio-git
pkgver=20110621
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('libcddb')
conflicts=('libcdio')
license=('GPL')
url=("http://www.gnu.org/software/libcdio/")
pkgdesc="GNU Compact Disc Input and Control Library"

_gitroot="git://git.sv.gnu.org/libcdio.git"
_gitname="libcdio"

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
  # disabled some stuff, build breaks otherwise
  ./configure --prefix=/usr --disable-vcd-info --disable-cpp-progs --without-cd-drive --without-cd-info --without-cd-read --without-iso-read --without-iso-info
  pushd doc > /dev/null
  sed -i "s/@include version.texi//" libcdio.texi
  popd > /dev/null
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
