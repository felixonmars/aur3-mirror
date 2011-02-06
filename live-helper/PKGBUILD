# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=live-helper
pkgver=20100503
pkgrel=1
pkgdesc="Tool to create debian-based live cd/dvd/usb images."
arch=('i686' 'x86_64')
url="http://live.debian.net/"
license=('GPL')
depends=('debootstrap' 'bash')
source=()

_gitroot="git://live.debian.net/git/live-helper.git"
_gitname="live-helper"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  #
  # BUILD HERE
  #

  cd ${srcdir}/${_gitname}
  make install DESTDIR=${pkgdir}
}
