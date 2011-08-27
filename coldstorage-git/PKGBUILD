# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=coldstorage-git
# There are no releases, only a git repository
pkgver=20100828
pkgrel=1
pkgdesc="A backup tool using Git."
arch=('i686' 'x86_64')
url="http://gitorious.org/coldstorage"
license=('GPL3')
depends=('git' 'qt')
makedepends=('')
source=()
md5sums=()

_gitroot="git://gitorious.org/coldstorage/coldstorage.git"
_gitname="coldstorage"

build() {
  cd $srcdir

  # checkout
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone --depth 1 $_gitroot $_gitname && cd $_gitname
  fi

  qmake
  make
}

package() {
  cd $srcdir/coldstorage

  install -D -m 755 coldstorage $pkgdir/usr/bin/coldstorage
}
# vim:syntax=sh

