# Maintainer: Scott Garrett <wintevenom[(at)]gmail.com>

pkgname=musca-mm-git
pkgver=20101227
pkgrel=1
pkgdesc="Musca with Procylon patch, future improvements to come."
arch=('i686' 'x86_64')
url="http://github.com/joeDeuce/musca--"
license=('GPL')
depends=('libx11' 'dmenu')
makedepends=('gcc' 'gcc-libs' 'make' 'git')
conflicts=('musca' 'musca-bzr')
provides=('musca')

_gitroot="git://github.com/joeDeuce/musca--.git"
_gitname="musca--"

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

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 musca $pkgdir/usr/bin/musca
  install -Dm644 musca.1 $pkgdir/usr/share/man/man1/musca.1
}

# vim: ft=sh syn=sh et
