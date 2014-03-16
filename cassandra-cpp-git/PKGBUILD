# Maintainer: William Robertson <wkr@wkr.io>
pkgname='cassandra-cpp-git'
pkgver='0.7.0'
pkgrel='1'
pkgdesc="C++ driver for Cassandra."
arch=('x86_64')
url='https://github.com/datastax/cpp-driver'
license=('Apache')
groups=()
depends=('boost' 'libssh2' 'openssl' 'zlib')
makedepends=('git' 'clang')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot='https://github.com/datastax/cpp-driver.git'
_gitname='cpp-driver'

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

  CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
