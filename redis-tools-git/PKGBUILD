# Maintainer: Brian Knox <taotetek at gmail>

pkgname=redis-tools-git
pkgver=20101203
pkgrel=1
pkgdesc="Redis toolset"
arch=('i686' 'x86_64')
url="http://github.com/antirez/redis-tools/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git make')
conflicts=('redis-tools')
provides=('redis-tools')
_gitroot="git://github.com/antirez/redis-tools.git"
_gitname="redis-tools"
unset CFLAGS

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ]; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated"
  else
    git clone $_gitroot
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build
}

package() {
  cd "$srcdir/$_gitname-build"
  make 
  install -Dm755 redis-stat "$pkgdir/usr/bin/redis-stat"
  install -Dm755 redis-load "$pkgdir/usr/bin/redis-load"
}
