# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=hat-darcs
pkgver=20080914
pkgrel=1
pkgdesc="A tracer for haskell"
arch=('x86_64')
url="http://darcs.haskell.org/hat/"
license=('GPL')
depends=()
makedepends=('ghc' 'hmake')
conflicts=('hat')
install=
source=()
md5sums=()

_darcstrunk="http://darcs.haskell.org"
_darcsmod="hat"

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

  rm -r "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"
  cd "$srcdir/$_darcsmod-build"

  msg "Starting build"

  # BUILD

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  rm -f $pkgdir/usr/bin/harch # this is provided by hmake, probably not necessary
                              # for runtime?
}
