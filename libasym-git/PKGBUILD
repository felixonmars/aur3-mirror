#Maintainer dawn <crackofdusk at gmail dot com>
pkgname=libasym-git
pkgver=20100726
pkgrel=1
pkgdesc="Library for asym: a fast and lightweight IRC client which (soon) aims to become smart and able to learn from its user thanks to a small IA"
arch=('i686' 'x86_64')
url="http://asym.tyruiop.org"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
provides=('libasym')

_gitroot="http://github.com/Tyruiop/libasym.git"
_gitname="libasym"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin) || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build || return 1
  cp -r $_gitname $_gitname-build || return 1
  cd $_gitname-build || return 1

  mkdir -p $pkgdir/etc $pkgdir/usr/lib $pkgdir/usr/include || return 1
  ./configure  || return 1
  cd build || return 1

  sed -i "s|/usr/local/|/usr/|g" Makefile || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
