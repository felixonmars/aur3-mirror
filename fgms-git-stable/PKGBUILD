# Maintainer: Nicola Bignami <nicola@kernel-panic.no-ip.net>
# Contributor: ImNtReal

pkgname=fgms-git-stable
pkgver=20130601
pkgrel=1
pkgdesc="FlightGear Multiplayer Server - stable branch from GIT"
arch=('i686' 'x86_64')
url="http://fgms.sourceforge.net"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'make')
provides=('fgms')
backup=('etc/fgms.conf')
install='fgms.install'
source='http://kernel-panic.no-ip.net/archlinux/fgms.service'
md5sums=('bfb1a96b1590f797dfd2362c7bcb3c63')


_gitroot="http://git.gitorious.org/fgms/fgms-0-x.git"
_gitname="fgms-0-x"

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

  if [ ! -e "$srcdir/build" ]
    then
      mkdir "$srcdir/build"
  fi
  
  cd "$srcdir/build"
  cmake "$srcdir/$_gitname" -DCMAKE_INSTALL_PREFIX=/usr -DSBINDIR=/usr/bin -DSYSCONFDIR=/etc
  make
}

package() {
  cd "$srcdir/build"
  mkdir "$pkgdir/etc"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/lib"
  mkdir "$pkgdir/usr/lib/systemd"
  mkdir "$pkgdir/usr/lib/systemd/system"
  make DESTDIR="$pkgdir" install
  install -m644 $srcdir/$_gitname/contrib/etc/fgms_local.skel.conf $pkgdir/etc/fgms.conf
  install -m644 $srcdir/fgms.service $pkgdir/usr/lib/systemd/system/fgms.service
}