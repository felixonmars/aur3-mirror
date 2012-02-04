# Maintainer: Jannik Heller <scrawl@baseoftrash.de>

pkgname=notify-osd-conf
pkgver=425
pkgrel=1
pkgdesc="Notify-OSD patched to be configurable"
url="https://edge.launchpad.net/notify-osd"
license="GPL"
arch=('i686' 'x86_64')
depends=('gconf' 'cairo' 'freetype2' 'libwnck')
makedepends=('bzr' 'gnome-common' 'libnotify')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')
install=$pkgname.install
source=('notify-osd.patch')
md5sums=('57e3bd7e5c8483ee46e5d041b36c797e')

_bzrtrunk=lp:notify-osd
_bzrmod=notify-osd

build() {
  cd "$srcdir"

  msg "Connecting to notify-osd bzr server...."

  if [ ! -d $srcdir/$_bzrmod ] ; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  msg "bzr checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_bzrmod-build
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  cd $srcdir/$_bzrmod-build

  patch -Np1 -i $srcdir/notify-osd.patch || return 1

  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/notify-osd || return 1
  # do not build examples causing redundant build dependencies
  sed -i "s|\(^SUBDIRS.*\)examples\(.*\)$|\1\2|" Makefile
  make || return 1
  make install DESTDIR="$pkgdir" || return 1
}
