# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-sphinx-to-github
pkgver=20120926
pkgrel=1
pkgdesc="Help you to get around the github-pages Jekyll behaviour"
arch=('i686' 'x86_64')
url="https://github.com/michaeljones/sphinx-to-github"
license=('BSD')
depends=() 
optdepends=()
makedepends=('git' 'python2')
provides=()
conflicts=()
source=()
md5sums=()

_gitroot="https://github.com/michaeljones/sphinx-to-github.git"
_gitname="sphinx-to-github"

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

  #
  # BUILD HERE
  #

  python2 setup.py install --root="${pkgdir}"
}


# vim:set ts=2 sw=2 et:
