# Maintainer: mathieui <mathieui@mathieui.net>

pkgname='libopenotr-git'
pkgver=20120516
pkgrel=1
pkgdesc="An OTR library"
arch=('i686' 'x86_64')
url="https://github.com/teisenbe/libopenotr"
license=('ISC') # ~= BSD
depends=('python')
makedepends=('git' 'python')
provides=('pyotr')
source=()

_gitroot="https://github.com/teisenbe/libopenotr.git"
_gitname="libopenotr"

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

  # main lib
  ./autogen.sh
  ./configure --prefix=/usr --enable-gaping-security-hole
  make
  cd "$srcdir/$_gitname-build/python"
  # python module
  python3 setup.py build
}

package() {
  # main lib
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  # python module
  cd "$srcdir/$_gitname-build/python"
  python3 setup.py install --prefix $pkgdir/usr
}

# vim:set ts=2 sw=2 et:
