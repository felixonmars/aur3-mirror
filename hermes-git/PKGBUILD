# Contributor: Chris Bolton <chriskun@saikonet.org>
pkgname=hermes-git
pkgver=20110613
pkgrel=1
pkgdesc="A social network status distributer with feed importing and regular expression filtering."
arch=('i686' 'x86_64')
url="http://github.com/stythys/hermes"
makedepends=('git' 'ghc' 'cabal-install' 'haskell-parsec' 'haskell-http' 'haskell-regex-compat')
license=('GPLv3')

_gitroot="git://github.com/Stythys/Hermes.git"
_gitname="hermes"

build() {
  msg "Installing cabal packages...."
  cabal update
  cabal install hoauth-0.2.5
  cabal install web-encodings

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --recurse-submodules $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recurse-submodules "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ghc -O2 --make Main -threaded -rtsopts -o hermes
  mkdir -p $pkgdir/usr/bin
  install -m755 hermes $pkgdir/usr/bin
}
