# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=pmmc-git
pkgver=20120921
pkgrel=1
pkgdesc="Poor Man's Media Centre, a bash script for selecting media to play using dmenu"
arch=('any')
url="https://github.com/rlp10/pmmc"
license=('unknown')
depends=('bash' 'dmenu' 'mplayer')
makedepends=('git')
install=pmmc.install
_gitroot="git://github.com/rlp10/pmmc.git"
_gitname="pmmc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  mkdir -p $pkgdir/usr/{bin,share/doc/pmmc}

  cd "$srcdir/$_gitname-build"
  cp pmmc $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/pmmc
  cp example_pmmcrc README.md $pkgdir/usr/share/doc/pmmc
}
