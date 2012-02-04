# Maintainer M Rawash <mrawash@gmail.com>

pkgname=gnome-main-menu-git
pkgver=20090526
pkgrel=1
pkgdesc="An alternative GNOME main-menu applet used in open/SUSE"
url="http://www.novell.com/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
depends=('gnome-panel' 'libgtop' "libnetworkmanager>=0.7.0" 'wireless_tools' 'gtk-doc')
makedepends=('intltool' 'pkgconfig' 'git' 'gnome-common')
optdepends=('libbeagle: search bar')
provides=('gnome-main-menu' 'gnome-main-menu-svn')
conficts=('gnome-main-menu' 'gnome-main-menu-svn')
replaces=('gnome-main-menu' 'gnome-main-menu-svn')
install=gnome-main-menu.install
options=('!libtool' '!emptydirs')

_gitroot="git://git.gnome.org/gnome-main-menu"
_gitname="gnome-main-menu"

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

  ./autogen.sh --prefix=/usr
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install || return 1

  mkdir -p ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas ${pkgdir}/usr/etc/gconf/schemas/*.schemas
  rm -rf ${pkgdir}/usr/etc/gconf/schemas
}

