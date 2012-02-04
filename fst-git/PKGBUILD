# Maintainer: Ray Rashif <schivmeister@gmail.com>

pkgname=fst-git
pkgver=20091102
pkgrel=1
pkgdesc="FreeST: Standalone wrapper for Windows VST plug-ins"
arch=(i686)
url="http://www.joebutton.co.uk/fst/"
license=('GPL')
depends=('lash' 'wine')
makedepends=('git')
provides=('fst')
conflicts=('fst')
install=fst-git.install
source=()
md5sums=()

_gitroot="git://repo.or.cz/fst.git"
_gitname="fst"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname
  msg "Compiling..."
  make || return 1

  # executable
  install -Dm755 fst.exe "$pkgdir/usr/bin/fst"

  # libraries
  mkdir -p "$pkgdir/usr/lib/fst"
  install -m644 *.o "$pkgdir/usr/lib/fst/"
  install -m755 fst.exe.so "$pkgdir/usr/lib/libfst.so"

  # header
  install -Dm644 fst.h "$pkgdir/usr/include/fst.h"
}
