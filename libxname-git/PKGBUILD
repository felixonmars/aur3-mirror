# Maintainer: Bucky Wolfe <igneous@therealigneo.us>

pkgname=libxname-git
pkgver=20120625
pkgrel=1
pkgdesc="Simple high(er)-level wrapper for xlib's XStoreName"
arch=('i686' 'x86_64')
url="http://github.com/igneous/libxname"
license=('zlib')
depends=('libx11')
makedepends=('git')
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/Igneous/libxname.git
_gitname=libxname

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
