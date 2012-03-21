pkgname=xbfuse-git
pkgver=20120321
pkgrel=1
pkgdesc="Mount an Xbox (360) iso using FUSE"
arch=('x86' 'x86_64')
url="http://multimedia.cx/xbfuse/"
license=('GPL')
groups=()
depends=('fuse')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('xbfuse.patch')
noextract=()
md5sums=('4199538b5f84fade7af196b10e568e24')

_gitroot=https://github.com/multimediamike/xbfuse.git
_gitname=master

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  
  patch < $srcdir/xbfuse.patch
  
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
