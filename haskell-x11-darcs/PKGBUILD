# Contributor: Adam Vogt <vogt.adam@gmail.com>
# Contributor: aeolist <aeolist@hotmail.com>
pkgname=haskell-x11-darcs
pkgver=20130312
pkgrel=1
pkgdesc="A Haskell binding to the X11 graphics library."
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/X11"
license=('BSD3')
makedepends=('darcs' 'ghc' 'autoconf' 'automake')
provides=('haskell-x11')
conflicts=('haskell-x11')
replaces=('haskell-x11-extras' 'haskell-x11-extras-darcs')
install=hsmod.install

_darcstrunk="http://darcs.haskell.org"
_darcsmod="X11"

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

  autoreconf

  runhaskell Setup configure --prefix=/usr || return 1
  runhaskell Setup build || return 1
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
}
package() {
  cd "$srcdir/$_darcsmod-build"

  install -D -m744 register.sh $pkgdir/usr/share/haskell/$pkgname/register.sh
  install -m744 unregister.sh $pkgdir/usr/share/haskell/$pkgname/unregister.sh

  runhaskell Setup copy --destdir=$pkgdir || return 1
 
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/BSD3
}
# vim:set ts=2 sw=2 et:
