# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-panel-myzone-git
pkgver=20110303
pkgrel=1
pkgdesc="MeeGo MyZone panel"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('mutter-meego-git' 'libsocialweb' 'jana-git' 'telepathy-glib')
makedepends=('git' 'intltool')
provides=('meego-panel-myzone')
conflicts=('meego-panel-myzone')
options=('!libtool')
install=meego-panel-myzone.install

_gitroot="git://gitorious.org/meego-netbook-ux/meego-panel-myzone.git"
_gitname="meego-panel-myzone"

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
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/meego-panel-myzone.schemas" \
    --domain meego-panel-myzone ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
