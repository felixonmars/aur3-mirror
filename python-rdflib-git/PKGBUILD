# Maintainer: Nikolay Bryskin <devel.niks@gmail.com>

pkgname=python-rdflib-git
pkgver=20121206
pkgrel=1
pkgdesc="A Python3 library for working with RDF, a simple yet powerful language for representing information"
arch=('any')
url="http://en.wikipedia.org/wiki/RDFLib"
license=('BSD')
groups=('devel')
depends=('python')
makedepends=('python-distribute' 'python-isodate' 'git')
provides=('python-rdflib')
source=()
_gitroot="git://github.com/RDFLib/rdflib.git"
_gitname="rdflib"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/"
} 

# vim:set ts=2 sw=2 et:
