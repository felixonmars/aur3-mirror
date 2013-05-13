# Maintainer: PyrO_70 <brieuc.roblin at gmail dot com>
pkgname=disksystemtray-git
pkgver=20100719
pkgrel=1
pkgdesc="Qt systemtray client for UDisks and UIso."
arch=('i686' 'x86_64')
url="http://www.pyrotools.org/"
license=('GPL')
depends=('qt4' 'uiso-git')
makedepends=('git' 'qt4-qmake')

_gitroot="git://gitorious.org/ptdisksystemtray/ptdisksystemtray.git"
_gitname="ptdisksystemtray"

build() {
  cd "$srcdir"

  msg2 "Connecting to gitorious ..."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone $_gitroot $_gitname || return 1
  fi

  msg2 "Starting make..."
  
  cd "$_gitname"

  qmake || return 1
  make || return 1

  #installing binary
  install -D -m755 PtDiskSystemTray "$pkgdir"/usr/bin/DiskSystemTray

} 

