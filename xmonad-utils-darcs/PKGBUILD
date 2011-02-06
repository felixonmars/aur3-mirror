# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>
pkgname=xmonad-utils-darcs
pkgver=20090305
pkgrel=1
pkgdesc="A small collection of X utilities useful when running XMonad."
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/xmonad-utils"
license=('BSD')
depends=('ghc' 'haskell-x11' 'gmp')
makedepends=('darcs')
provides=('xmonad-utils')
source=()
md5sums=()

_darcstrunk="http://gorgias.mine.nu/repos/"
_darcsmod="xmonad-utils"

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

  runhaskell Setup.lhs configure --prefix=/usr || return 1
  runhaskell Setup.lhs build || return 1
  runhaskell Setup.lhs copy --destdir="$pkgdir" || return 1
  chmod u+s "$pkgdir/usr/bin/hslock"
}
