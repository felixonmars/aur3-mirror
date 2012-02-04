# Contributor: Adam Vogt <vogt.adam@gmail>
# based on haskell-x11-darcs build (aeolist)
pkgname=haskell-typecompose-darcs
pkgver=20081013
pkgrel=1
pkgdesc="Type composition and other misplaced modules"
arch=('i686' 'x86_64')
url="http://haskell.org/haskellwiki/TypeCompose"
license=('unknown')
makedepends=('darcs' 'ghc')
conflicts=('haskell-typecompose')
provides=('haskell-typecompose')
install=(hsmod.install)
source=()
md5sums=()

_darcstrunk="http://darcs.haskell.org/packages"
_darcsmod="TypeCompose"

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

  runhaskell Setup configure --prefix=/usr || return 1
  runhaskell Setup build || return 1
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  install -D -m744 register.sh $startdir/pkg/usr/share/haskell/$pkgname/register.sh
  install -m744 unregister.sh $startdir/pkg/usr/share/haskell/$pkgname/unregister.sh

  runhaskell Setup copy --destdir=$startdir/pkg || return 1
 
  #install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/BSD3
}
# vim:set ts=2 sw=2 et:
