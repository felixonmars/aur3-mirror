# Maintainer: PedsXing <pedsxing at gmx dot net>
pkgname=vc-git
pkgver=20120509
pkgrel=1
pkgdesc="portable, zero-overhead SIMD library for C++"
url="http://code.compeng.uni-frankfurt.de/projects/vc/"
arch=('x86_64' 'i686')
license=('LGPLv3')
makedepends=('git' 'cmake')
conflicts=('vc')
provides=('vc')

_gitroot="git://code.compeng.uni-frankfurt.de/vc.git"
_gitname="vc"
 
build() {
  cd "$srcdir"
  msg "Connecting to the Git repository..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "Git clone done"
  msg "Starting make..."
  
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

check() {
  cd "$srcdir/$_gitname-build"
  make test
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}