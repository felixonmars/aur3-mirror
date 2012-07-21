# Maintainer: laloch <lalochcz@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

_pkgbasename=wineasio
pkgname="$_pkgbasename-git"
_lib=lib
_dll=wineasio.dll.so
pkgver=20120721
pkgrel=1
pkgdesc="Steinberg ASIO driver implementation for Wine"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wineasio/"
license=('LGPL')
depends=('wine' 'jack')
makedepends=('git' 'steinberg-asio')

if [ "$CARCH" = 'x86_64' ]; then
  _lib=lib32
  depends=('wine' 'lib32-jack')
  provides=('wineasio' 'lib32-wineasio' 'wineasio64')
  replaces=('wineasio' 'lib32-wineasio' 'wineasio64')
  conflicts=('wineasio' 'lib32-wineasio' 'wineasio64')
fi

install=$_pkgbasename.install

_gitroot="git://$_pkgbasename.git.sourceforge.net/gitroot/$_pkgbasename/$_pkgbasename"
_gitname="$_pkgbasename"

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

  ln -s /usr/include/steinberg-asio/asio.h
  
  make
  }

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 $_dll "$pkgdir/usr/$_lib/wine/$_dll"
}

# vim:set ts=2 sw=2 et:
