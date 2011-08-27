# Maintainer: PyrO_70 <brieuc.roblin at gmail dot com>
pkgname=uiso-git
pkgver=20100718
pkgrel=1
pkgdesc="Daemon providing userland mount and umount of ISO file using DBus."
arch=('i686' 'x86_64')
url="http://www.pyrotools.org/"
license=('GPL')
depends=('qt')
makedepends=('git')

_gitroot="git://gitorious.org/uiso/uiso.git"
_gitname="uiso"

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
  install -D -m755 uiso "$pkgdir"/usr/bin/uiso
  
  #installing daemon script
  install -D -m755 conf/uiso "$pkgdir"/etc/rc.d/uiso
  
  #installing dbus config
  install -D -m644 conf/org.pyrotools.UIso.conf "$pkgdir"/etc/dbus-1/system.d/org.pyrotools.UIso.conf
} 
