# Maintainer: Nikolay Bryskin <devel.niks@gmail.com>

pkgname=python-rdflib-hg
pkgver=0
pkgrel=1
pkgdesc="A Python3 library for working with RDF, a simple yet powerful language for representing information"
arch=('any')
url="https://bitbucket.org/gromgull/rdflib-python3"
license=('BSD')
groups=('devel')
depends=('python')
makedepends=('python-distribute' 'mercurial')
provides=('python-rdflib')
source=()
_hgroot="https://bitbucket.org/gromgull"
_hgrepo="rdflib-python3"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  python setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python setup.py install --root="$pkgdir/"
} 
