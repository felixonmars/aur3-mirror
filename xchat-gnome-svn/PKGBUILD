# $Id: PKGBUILD,v 1.12 2007/04/22 16:45:03 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xchat-gnome-svn
pkgver=2570
pkgrel=1
pkgdesc="GNOME frontend to the popular X-Chat IRC client."
arch=(i686 x86_64)
license=('GPL')
url="http://xchat-gnome.navi.cx/"
options=('!libtool')
depends=('libgnomeui>=2.18.1-2' 'libsexy>=0.1.11' 'scrollkeeper' 'dbus-glib')
makedepends=('gettext' 'perlxml' 'python' 'tcl' 'libnotify' 'gnome-doc-utils>=0.10.3' 'gnome-common' 'intltool')
conflicts=('xchat-gnome')
provides=('xchat-gnome')
install=xchat-gnome-svn.install
source=()
md5sums=()

_svntrunk=http://svn.gnome.org/svn/xchat-gnome/trunk/
_svnmod=xchat-gnome

build() {
  cd ${startdir}/src

  if [[ -d ${_svnmod}/.svn ]]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --enable-ipv6 --enable-shm \
	      --disable-gtkfe --disable-scrollkeeper || return 1

  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas

  rm -rf ${startdir}/src/${_svnmod}-build
}
