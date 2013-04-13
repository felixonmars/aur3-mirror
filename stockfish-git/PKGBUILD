# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: P. Badredin <p dot badredin at gmail dot com>
# Contributor: Justin Blanchard <UncombedCoconut at gmail dot com>

pkgname=stockfish-git
_gitname=Stockfish
pkgver=fe72c93
pkgrel=1
pkgdesc="A free UCI chess engine derived from Glaurung 2.1"
arch=('i686' 'x86_64')
url="http://stockfishchess.org/"
license=('GPL3')
optdepends=('polyglot: for xboard support')
makedepends=('git')
provides=('stockfish')
conflicts=('stockfish')
install=stockfish.install
source=('git://github.com/mcostalba/Stockfish.git'
        'http://cl.ly/3x333m0G173F/download/stockfish-231-book.zip')
md5sums=('SKIP'
         '9e51c2e57d8b55bbc588150033e4b133')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname/src

  # Disable -flto to work around g++ 4.8.0 bug
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56775
  sed -i '360d' Makefile

  # Change the default book path to a system-wide location
  sed -i '/Book File/s:book.bin:/usr/share/stockfish/book.bin:' ucioption.cpp

  if [[ "$CARCH" == "i686" ]]; then
    _arch=x86-32
  elif grep -q popcnt /proc/cpuinfo; then
    _arch=x86-64-modern
  else     
    _arch=x86-64
  fi

  msg "Making profile $_arch"
  make profile-build ARCH=$_arch
}

package() {
  cd $srcdir
  install -Dm644 Book.bin "$pkgdir/usr/share/stockfish/book.bin"

  cd $_gitname/src
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
