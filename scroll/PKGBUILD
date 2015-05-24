# Maintainer: Jookia <166291@gmail.com>

pkgname=scroll
pkgver=1.20150323
pkgrel=2
pkgdesc="scroll(6), a roguelike game"
arch=("i686" "x86_64")
url="https://joeyh.name/code/scroll/"
license=("GPL2")
depends=("ncurses")
makedepends=("cabal-install" "ghc" "alex" "happy")
source=("scroll::git://git.kitenet.net/scroll.git#commit=$_commit")
md5sums=("SKIP")

# Check integrity by using a commit hash instead of tag name.
_commit=("fffa063d15fc33599d4ad4c1851397ee4481fb37")

prepare() {
  cd "$pkgname"
  
  # Create a sandbox for building and start adding constraints.
  cabal sandbox init
  cabal update
  echo "constraints:" > cabal.config
  
  # Arch Linux uses ncurses instead of ncursesw for its header file.
  echo "  ncurses +force-narrow-library," >> cabal.config
  
  # Gotta use a low version of c2hs because of ncurses parsing issues.
  # https://github.com/haskell/c2hs/issues/123
  # https://github.com/haskell/c2hs/issues/125
  echo "  c2hs < 0.21" >> cabal.config
  cabal install c2hs
  
  # Get ready for building!
  cabal install --only-dependencies
  cabal configure -O --prefix=/usr
}

build() {
  cd "$pkgname"
  cabal build
}

package() {
  cd "$pkgname"
  cabal copy --destdir="${pkgdir}"
}

