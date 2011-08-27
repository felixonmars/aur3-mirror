# Maintainer: Gordin <9ordin @t gmail dot com>
pkgname=python2-cython-git
pkgver=20110722
pkgrel=1
pkgdesc="C-Extensions for Python - latest git master - python2 version"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python2')
makedepends=('git')
provides=(python2-cython cython)
conflicts=(python2-cython cython)

_gitroot="https://github.com/cython/cython.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root=$startdir/pkg || return 1
}
