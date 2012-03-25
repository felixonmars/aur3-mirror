pkgname=luminescence-git
pkgver=20120325
pkgrel=1
pkgdesc="A plugin-based minimalistic browser"

url="http://github.com/fmang/luminescence"
license=('BSD3')

arch=('i686' 'x86_64')
depends=('gtk3' 'libwebkit3')
makedepends=('git' 'gcc' 'pkg-config')

_gitroot="git://github.com/fmang/luminescence.git"
_gitname="luminescence"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]] ; then
    cd $_gitname
    make clean
    git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
    cd $_gitname
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting build..."
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/usr" install
}
