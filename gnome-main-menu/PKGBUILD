#! /bin/bash
# Maintainer : Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=gnome-main-menu
pkgver=0.9.16
pkgrel=1
pkgdesc="Novell SLED Gnome main-menu applet"
url="http://www.novell.com/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
depends=('gnome-panel' 'libgtop' 'networkmanager' 'wireless_tools' 'libslab') 
makedepends=('intltool' 'pkgconfig' 'gnome-common')
optdepends=('libbeagle: search bar')
conflicts=('gnome-main-menu-svn'
	   'gnome-main-menu-git')
replaces=('sled')
install=gnome-main-menu.install
options=('!libtool' '!emptydirs')
source=("ftp://ftp.gnome.org/pub/gnome/sources/gnome-main-menu/0.9/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4a300ab71434c2624f3d2b81d8039499163e56edf9bcfa5248158046ddf19cc9d41029c7d231c9ff73cb3582369bc33b29fe6c3af532409181bbc75b0191bcf4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/DeviceKit --disable-static 
	make
  }
package() {	
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install

	mkdir -p ${pkgdir}/usr/share/gconf/schemas
	gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas ${pkgdir}/etc/gconf/schemas/*.schemas
	rm -rf ${pkgdir}/etc/gconf/schemas
  }