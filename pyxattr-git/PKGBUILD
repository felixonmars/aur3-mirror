# Contributor: Michael Pusterhofer <michael.pusterhofer@aon.at>
pkgname=pyxattr-git
pkgver=20100515
pkgrel=1
pkgdesc="A python extension module that allows you to manipulate the extended attributes present in some os/filesystem combinations"
arch=("i686" "x86_64")
url="http://pyxattr.sourceforge.net/"
license=("LGPL")
depends=("python" "attr")
makedepends=("git")
provides=("pyxattr")
conflicts=("pyxattr")

_gitroot="git://git.k1024.org/pyxattr.git"
_gitname="pyxattr"

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
  cd "$srcdir/$_gitname"

  #
  # BUILD HERE
  #

  python setup.py install --root="$pkgdir" || return 1

} 
