# Maintainer: Marti Raudsepp <marti@juffo.org>
# Original author: Jan de Groot <jgc@archlinux.org>

pkgname=udisks-git
pkgver=20110429
pkgrel=1
pkgdesc="Disk management daemon (previously known as DeviceKit-disks)"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/DeviceKit"
license=('GPL')
depends=('udev>=146' 'sg3_utils>=1.28' 'dbus-glib>=0.82' 'polkit>=0.94' 'parted>=1.9.0-3' 'device-mapper>=2.02.53' 'libatasmart>=0.17' 'lvm2>=2.02.58')
makedepends=('intltool' 'gtk-doc' 'git')
replaces=()
install=udisks.install
provides=("udisks=1.0.1")
conflicts=('devicekit-disks' 'udisks')
options=('!libtool')
source=()

_gitroot="git://anongit.freedesktop.org/git/udisks"
_gitname="udisks"

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

  ./autogen.sh \
    --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/udisks --disable-static
  make
  make DESTDIR="$pkgdir" install
}
