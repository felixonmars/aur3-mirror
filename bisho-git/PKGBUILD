# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=bisho-git
pkgver=20110303
pkgrel=1
pkgdesc="Provides access to the social web services from the MyZone"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('meego-gnome-control-center-git' 'libsocialweb')
makedepends=('git' 'intltool')
provides=('bisho')
conflicts=('bisho')
options=('!libtool')
install=bisho.install

_gitroot="git://gitorious.org/meego-netbook-ux/bisho.git"
_gitname="bisho"

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
    --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/bisho.schemas" \
    --domain bisho ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
