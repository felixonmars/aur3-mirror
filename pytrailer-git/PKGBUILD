# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=pytrailer-git
pkgver=20100921
pkgrel=1
pkgdesc="Python library to simplify access to movies on apple.com/trailers"
url="http://code.google.com/p/pytrailer/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python')
makedepends=('git')

_gitroot="http://github.com/sochotnicky/pytrailer.git"
_gitname="pytrailer"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull --rebase
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/$_gitname
  python setup.py install --root $pkgdir
}