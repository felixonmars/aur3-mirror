# Maintainer: strake <strake888@gmail.com>
pkgname=laurel-git
pkgver=20110709
pkgrel=1
pkgdesc="Fetch, build, install packages and those they need, deeply. ABS, Cabal/Hackage, AUR."
url="https://gitorious.org/laurel"
license=('GPL')
arch=('i686' 'x86_64')
groups=()
depends=('zlib' 'curl' 'gmp' 'libssh2' 'glibc' 'package-query')
makedepends=('git' 'ghc' 'haskell-failure' 'haskell-control-monad-failure' 'haskell-transformers' 'haskell-containers' 'haskell-archlinux' 'haskell-cabal' 'haskell-directory' 'haskell-temporary' 'haskell-process' 'haskell-curl' 'haskell-zlib' 'haskell-tar' 'haskell-archlinux-web' 'haskell-split' 'haskell-mtl' 'haskell-monad-control')
provides=('laurel')
conflicts=('laurel')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://gitorious.org/laurel/laurel.git"
_gitname="laurel"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "${pkgdir}/usr/bin/"
  cp laurel "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/man/man8/"
  gzip laurel.8
  cp laurel.8.gz "${pkgdir}/usr/share/man/man8/"
  mkdir -p "${pkgdir}/usr/share/laurel/"
  cp *provide*.txt "${pkgdir}/usr/share/laurel/"
}
