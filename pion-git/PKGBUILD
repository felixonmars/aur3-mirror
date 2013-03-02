# Maintainer: kotyz <kotyz.king@gmail.com>

pkgname=pion-git
pkgver=20130302
pkgrel=1
pkgdesc="A C++ development library for implementing lightweight HTTP interfaces (git version)"
arch=('i686' 'x86_64')
url="http://www.cloudmeter.com/pion/support/"
license=('custom:Boost')
depends=('boost-libs' 'openssl' 'log4cpp')
makedepends=('git' 'boost')
provides=('pion-net=5.0.0' 'pion=5.0.0')
conflicts=('pion-net' 'pion')
replaces=('pion-net')

_gitroot=git://github.com/cloudmeter/pion.git
_gitname=pion

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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
