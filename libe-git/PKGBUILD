pkgname=libe-git
pkgver=20120809
pkgrel=1
pkgdesc="libe-git"
arch=('i686' 'x86_64')
url="https://github.com/rescrv/e"
license=('own')
depends=('libpo6')
makedepends=('git' 'autoconf')

_gitroot="https://github.com/rescrv/e.git"
_gitname="libe"

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

  autoreconf -i
  ./configure
  make
}

package(){
   cd "$srcdir/$_gitname-build"
   make DESTDIR="$pkgdir" PREFIX=/usr  install
}
