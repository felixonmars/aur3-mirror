# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname=i8kmonitor
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple fan control daemon for i8k (Dell Latitude and Inspiron notebooks)"
arch=(any)
url="http://github.com/nopper/i8kmonitor"
license=('GPL')
depends=('python' 'i8kutils')
makedepends=('make' 'git')

_pgitroot="git://github.com/nopper/i8kmonitor.git"
_pgitname="i8kmonitor"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_pgitname ] ; then
    cd $_pgitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_pgitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_pgitname-build"
  git clone "$srcdir/$_pgitname" "$srcdir/$_pgitname-build"
  cd "$srcdir/$_pgitname-build"
  git checkout -f v$pkgver

  sed -i "s|ROOT =|ROOT = ${pkgdir}|" Makefile || return 1
  make archlinux || return 1
}

# vim:set ts=2 sw=2 et:
