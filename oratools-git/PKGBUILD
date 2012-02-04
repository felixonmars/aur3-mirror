# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=oratools-git
pkgver=20100926
pkgrel=1
pkgdesc="Tools for OpenRaster development."
arch=(any)
url="http://create.freedesktop.org/wiki/OpenRaster"
license=('LGPL')
depends=('python-lxml')
makedepends=('git')
provides=('oratools')
conflicts=('oratools')

_gitroot="git://gitorious.org/openraster/openraster-misc.git"
_gitname="openraster-misc"

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

  cd oratools
  ./setup.py install --root="$pkgdir"
} 
