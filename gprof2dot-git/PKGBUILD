
# Contributor: tocer <tocer.deng@gmail.com>
pkgname=gprof2dot-git
pkgver=20111020
pkgrel=1
pkgdesc="A Python script to convert the output from many profilers into a dot graph."
arch=("any")
url="http://code.google.com/p/jrfonseca/wiki/Gprof2Dot"
license=('LGPL')
depends=(python2)
makedepends=('git')
provides=(gprof2dot)
_gitroot="https://code.google.com/p/jrfonseca.gprof2dot/"
_gitname="jrfonseca.gprof2dot"
md5sums=()

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

  msg "Starting build process."
  sed -i '1s/python$/python2/' gprof2dot.py
  install -D -m 755 gprof2dot.py $pkgdir/usr/bin/gprof2dot
} 
