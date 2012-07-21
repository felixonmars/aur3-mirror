# Maintainer: Alex Belanger <i.caught.air@gmail.com>

pkgname=cde-git
pkgver=20120720
pkgrel=1
pkgdesc="Automatically create portable Linux applications"
url="http://www.pgbovine.net/cde.html"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git')
provides=('cde')
conflicts=('cde')

_gitroot="git://github.com/pgbovine/CDE.git"
_gitname="cde"

build() {
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

  make
}

package() {
    cd $srcdir/$_gitname-build
    install -Dm755 cde $pkgdir/usr/bin/cde
    install -Dm755 cde-exec $pkgdir/usr/bin/cde-exec
}
