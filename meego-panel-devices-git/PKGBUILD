# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-panel-devices-git
pkgver=20110303
pkgrel=1
pkgdesc="MeeGo devices panel"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('mutter-meego-git' 'libpulse' 'upower')
makedepends=('git' 'intltool')
provides=('meego-panel-devices')
conflicts=('meego-panel-devices')
install=meego-panel-devices.install
source=('upower.patch')
md5sums=('bf2f3219a2b8cc65276672934f1811a1')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-panel-devices.git"
_gitname="meego-panel-devices"

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

  patch -Np1 -i ${srcdir}/upower.patch

  ./autogen.sh
  ./configure --prefix=/usr \
    --libexec=/usr/lib \
    --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/meego-panel-devices.schemas" \
    --domain meego-panel-devices ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
