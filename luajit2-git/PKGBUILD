# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=luajit2-git
pkgver=20110818
pkgrel=1
pkgdesc="A Just-In-Time Compiler for Lua"
arch=('i686' 'x86_64')
url="http://luajit.org"
license=('MIT')
makedepends=('git')
conflicts=('luajit2')
provides=('luajit2')
source=()
md5sums=()

_gitroot="http://luajit.org/git/luajit-2.0.git"
_gitname="luajit-2.0"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make PREFIX=/usr
  make install DESTDIR=$pkgdir PREFIX=/usr
  LUAJITBIN=`ls $pkgdir/usr/bin/luajit-* | sed "s|$pkgdir||"`
  ln -sf "$LUAJITBIN" $pkgdir/usr/bin/luajit

  install -Dm644 "$srcdir/luajit-2.0/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"

  msg "This package does perform the symlink above."
}
