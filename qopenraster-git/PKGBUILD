# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=qopenraster
pkgname=$_pkgname-git
pkgver=20101114
pkgrel=1
pkgdesc="OpenRaster support for Qt (plug-in)"
arch=('x86_64' 'i686')
url="http://gitorious.org/openraster/qopenraster"
license=('LGPL')
makedepends=('git')
depends=('libora-git')
provides=($_pkgname)
conflicts=($_pkgname)

_gitroot="git://gitorious.org/openraster/qopenraster.git"
_gitname="$_pkgname"

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
  cd src

  # BUILD
  qmake
  make
  make install INSTALL_ROOT="$pkgdir/"
} 
