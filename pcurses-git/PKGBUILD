# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=pcurses-git
_pkgname=pcurses
pkgver=20110718
pkgrel=1
pkgdesc='A curses package browser using libalpm'
arch=('x86_64' 'i686')
url="https://github.com/schuay/$_pkgname"
license=('GPL')
conflicts=('pcurses')
depends=('ncurses' 'pacman-git')
makedepends=('boost' 'git' 'cmake')

_gitroot="git://github.com/schuay/$_pkgname.git"
_gitname=$_pkgname
_gitbranch='working'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname && git checkout -t origin/$_gitbranch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
