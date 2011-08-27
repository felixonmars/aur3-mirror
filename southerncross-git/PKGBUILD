# Maintainer: Scott Garrett <wintevenom[(at)]gmail.com>

pkgname=southerncross-git
pkgver=20110504
pkgrel=3
pkgdesc="SouthernCross is a minimal tiling window manager for X based on Musca."
arch=('i686' 'x86_64')
url="https://github.com/MartinWeigel/SouthernCross"
license=('GPL')
depends=('libx11' 'dmenu')
makedepends=('gcc' 'gcc-libs' 'make' 'git')
conflicts=('musca' 'musca-bzr')
provides=('musca')

_gitroot="git://github.com/MartinWeigel/SouthernCross.git"
_gitname="SouthernCross"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  mkdir -p bin

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 bin/southerncross $pkgdir/usr/bin/southerncross
  install -Dm644 man/musca.1 $pkgdir/usr/share/man/man1/southerncross.1
}

# vim: ft=sh syn=sh et
