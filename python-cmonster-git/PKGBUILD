# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-cmonster-git
pkgver=20120203
pkgrel=1
pkgdesc="Python wrapper for the Clang C++ preprocessor and parser."
url="https://github.com/axw/cmonster"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
makedepends=('git' 'cython' 'boost' 'llvm')
backup=()
install=

_gitroot="http://github.com/axw/cmonster"
_gitname=$pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  cd $startdir/src/$pkgname

  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

}