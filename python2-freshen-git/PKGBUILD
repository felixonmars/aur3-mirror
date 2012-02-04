# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=python2-freshen-git
pkgver=20110405
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Clone of the Cucumber BDD framework for Python"
url="https://github.com/rlisagor/freshen"
depends=('python2' 'python2-nose' 'python2-yaml')
makedepends=('git')

_gitroot="https://github.com/rlisagor/freshen.git"
_gitname="freshen"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root=$pkgdir
}
