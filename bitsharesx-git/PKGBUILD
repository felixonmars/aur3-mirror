# Maintainer: Fabian Schuh <mail@xeroc.org>
pkgname="bitsharesx-git"
pkgver="20140824"
pkgrel=1
pkgdesc="BitSharesX command line client/daemon"
url="http://www.bitshares-x.info"
arch=('x86_64' 'i686')
license=('unlicense')
depends=('boost')
makedepends=('git' 'cmake' 'clang' 'make')
_gitroot="git://github.com/dacsunlimited/bitsharesx.git"
_gitname="bitsharesx"
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "Starting build..."
  #rm -rf "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
  export CC=clang CXX=clang++
  cmake .
  make
}
package() {
  mkdir -p "$pkgdir/usr/bin/" 
  install -Dm755 "$srcdir/$_gitname/programs/client/bitshares_client"     "$pkgdir/usr/bin/bitsharesx"
}
# vim:set ts=2 sw=2 et:
