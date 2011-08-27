# Maintainer: Josh Kuhn <kuhn.joshua@gmail.com>

pkgname=epigram-darcs
pkgver=20100428
pkgrel=1
pkgdesc="A dependently typed programming language and an interactive programming environment"
arch=('i686' 'x86_64')
url="http://www.e-pig.org/"
license=('MIT')
depends=( 'gmp')
makedepends=( 'ghc>=6.12.1' 'darcs' 'she-darcs' 'haskell-mtl' 'haskell-pretty' )
provides=( 'epigram' )
conflicts=( 'epigram' )
options=( 'strip' )
_darcstrunk="http://www.e-pig.org/darcs"
_darcsmod="Pig09"

build() {
  #cd $srcdir
  if [[ -d $_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod/src
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --lazy $_darcstrunk/$_darcsmod
    cd $_darcsmod/src
  fi
  make depend || return 1
  make release || return 1
  install -D Pig ${pkgdir}/usr/bin/Pig || return 1
  install -D -m644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
