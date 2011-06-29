
#Maintainer: Swift Geek (swiftgeek (at) google mail service)
#Maintainer's bitcoin address: 1KkTAxW66TL9mTML3BpFMMSH8TRetvVtG4

pkgname=me-tv-git
pkgver=20110629
pkgrel=1
pkgdesc="Me TV is a GTK desktop application for watching digital television services that use the DVB standard - DVB-T, DVB-S, DVB-C and ATSC"
arch=('i686' 'x86_64')
url="https://github.com/lamothe/me-tv"
license=('GPL')
depends=('glibmm' 'gtkmm' 'gconfmm' 'glib2' 'sqlite3' 'linuxtv-dvb-apps' 'libunique' 'gnome-common' 'libgdamm')
makedepends=('intltool' 'git')
provides=('me-tv')
conflicts=('me-tv2-bzr')
install=me-tv-bzr.install

_gitroot="https://github.com/lamothe/me-tv.git"
_gitname="me-tv"

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

  cd "${srcdir}/${_gitname}" || return 1
  ./autogen.sh
  ./configure CXXFLAGS="$CXXFLAGS -D__KERNEL_STRICT_NAMES" --prefix=/usr || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain me-tv ${pkgdir}/usr/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/usr/etc/gconf/schemas/*.schemas

}
