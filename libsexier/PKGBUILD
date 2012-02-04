# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=libsexier
pkgver=20090524
pkgrel=1
pkgdesc="Experimental cairo gtk widgets"
arch=('i686' 'x86_64')
url="http://www.qdh.org.uk/wordpress/?s=libsexier"
license=('GPL')
depends=('librsvg')
makedepends=('git')
install=

_gitroot="git://git.codethink.co.uk/git/libsexier"
_gitname="libsexier"

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

  ./autogen.sh --prefix=/usr

  make || return 1
  make DESTDIR=$pkgdir install || return 1

}