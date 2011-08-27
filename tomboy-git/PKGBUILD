# $Id: PKGBUILD 78916 2010-04-29 13:25:20Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=tomboy-git
pkgver=20100905
pkgrel=1
pkgdesc="Desktop note-taking application for Linux and Unix"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/tomboy/"
depends=('gtkspell' 'gmime>=2.4.15' 'ndesk-dbus-glib>=0.4.1' 'gnome-sharp>=2.24.1' 'mono-addins>=0.4' 'libsm' 'gnome-desktop-sharp>=2.26.0' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig' 'gnome-panel>=2.30.0' 'gnome-doc-utils>=0.20.0')
options=('!libtool' '!emptydirs')
install=${pkgname}.install

_gitroot="git://git.gnome.org/tomboy"
_gitname="tomboy"


build() {
  export MONO_SHARED_DIR=${srcdir}/.wabi 
  mkdir -p ${MONO_SHARED_DIR}

  cd ${srcdir}
  if [ -d ${_gitname} ]; then
    cd  ${_gitname} 
    git pull origin
  else
    git clone ${_gitroot} ${_gitname}
  fi

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build
  
  ./autogen.sh --prefix=/usr --sysconfdir=/etc  --localstatedir=/var --disable-scrollkeeper --disable-update-mimedb 
  # override makepkg.conf - don't build with -j >1  
  make -j1 
  make DESTDIR=${pkgdir} GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install 

  install -m755 -d ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas --domain tomboy /etc/gconf/schemas/*.schemas 
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
