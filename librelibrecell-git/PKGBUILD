# Maintainer: cantabile <cantabile dots desu at gmail dots com>

_appname=librelibrecell
_suffix=-git
pkgname=$_appname$_suffix
pkgver=20120601
pkgrel=1
pkgdesc="A free FreeCell clone made with QT."
arch=('i686' 'x86_64')
url="https://github.com/dubhater/LibreLibreCell"
license=('custom:WTFPL')
depends=('qt')
makedepends=('git' 'cmake' 'bash')

_gitroot="git://github.com/dubhater/LibreLibreCell.git"
_gitname=$_appname

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

  mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  install -D -m644 "$srcdir/$_gitname-build/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
