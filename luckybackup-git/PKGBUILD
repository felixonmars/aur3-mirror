#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=luckybackup-git
pkgver=20120219
pkgrel=3
pkgdesc="Backup & Sync tool using Rsync and Qt4 (GIT version)"
arch=('any')
license=('GPL3')
depends=('qt4' 'rsync' 'openssh')
makedepends=('git')
url="http://luckybackup.sourceforge.net"
provides=('luckybackup')
conflicts=('luckybackup')

_gitroot="git://luckybackup.git.sourceforge.net/gitroot/luckybackup/luckybackup"
_gitname="luckybackup"

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

  qmake-qt4 || return 1
  make INSTALL_ROOT=${pkgdir}/ install || return 1

  msg "Removing leftover files..."
  rm -rf $srcdir/$_gitname-build
}
