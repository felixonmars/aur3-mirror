# Maintainer: Nicolas Pouillard
pkgname=darcs-bridge
pkgver=20110818
pkgrel=2
pkgdesc="Bidirectional synchronization between Darcs and Git"
url="http://darcs.net/DarcsBridgeUsage"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('ghc' 'cabal-install' 'darcs')
options=('strip')
source=('rename-bin.diff')
md5sums=('52c168a80ca0c7afe8360ac4f6e664b8')
_darcstrunk=http://darcsden.com/owst
_darcsrepo=darcs-fastconvert-gsoc

build() {
  cd "$srcdir"

  if [[ -d "$srcdir/$_darcsrepo"/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd "$_darcsrepo"
    darcs pull -a "$_darcstrunk/$_darcsrepo"
  else
    msg "Retrieving complete sources"
    darcs get --lazy "$_darcstrunk/$_darcsrepo"
  fi
  rsync -aH --del "$srcdir/$_darcsrepo/" "$srcdir"/build/
  cd "$srcdir"/build

  ORIG_HOME="$HOME"
  ORIG_TMPDIR="$TMPDIR"
  export HOME="$srcdir"/home
  export TMPDIR="$srcdir"/home/tmp
  mkdir -p "$HOME" "$TMPDIR"

  patch < "$srcdir"/rename-bin.diff
  cabal update
  cabal install --user

  install -D -m755 "$HOME"/.cabal/bin/darcs-fastconvert "$pkgdir"/usr/bin/$pkgname
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  export HOME="$ORIG_HOME"
  export TMPDIR="$ORIG_TMPDIR"
}
