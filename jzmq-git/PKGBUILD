# Contributor: Dmitry <ixaphire at gmail.com>

pkgname=jzmq-git
pkgver=20110729
pkgrel=1
pkgdesc="Java bindings for zmq, git version"
arch=(i686 x86_64)
url="http://www.zeromq.org/bindings:java"
license=('LGPL')
depends=('java-runtime' 'zeromq')
makedepends=('git')

_gitroot="git://github.com/zeromq/jzmq.git"
_gitname="jzmq"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make -j1 # -j2 or more fails for me, so we have to override MAKEFLAGS from /etc/makepkg.conf
} 

check() {
  cd "$srcdir/$_gitname-build"
  make -k check
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  mkdir "$pkgdir/usr/share/java/zmq" && mv "$pkgdir/usr/share/java/"{,zmq/}"zmq.jar" || return 1
} 

# vim:set ts=2 sw=2 et:
