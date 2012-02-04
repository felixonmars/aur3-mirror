# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-dataflow
pkgver=20090506
pkgrel=1
pkgdesc="a dataflow library for python"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/dataflow"
license=('BSD')
depends=('python')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/gfxmonk/py-dataflow.git"
_gitname="dataflow"

build() {
  cd $srcdir
  msg "connection to GIT server..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin || return 1
    msg "local files updated"
  else
    git clone $_gitroot $_gitname || return 1
  fi
  cd $startdir/src/$_gitname
  python setup.py install --root=$startdir/pkg --single-version-externally-managed || return 1
}
