# Maintainer: SpepS <dreamspepser at yahoo dot it>

_p=python-backports
pkgname=python2-backports-darcs
pkgver=20110629
pkgrel=1
pkgdesc="A collection of backported python features that run on python 2.5 or newer."
arch=('any')
url="http://www.icanblink.com"
license=('GPL')
depends=('python2')
provides=('python2-backports')
makedepends=('darcs')

_darcstrunk="http://devel.ag-projects.com/repositories"
_darcsmod="$_p"

build() {
  cd "$srcdir"

  msg "Checking for previous build"

  if [[ -d $_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi

  rm -rf "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"
  cd "$srcdir/$_darcsmod-build"

  msg "Starting build"

  #
  # BUILD
  #

  python2 setup.py build
}

package() {
  cd "$srcdir/$_darcsmod-build"

  python2 setup.py install --root="$pkgdir/"
}
