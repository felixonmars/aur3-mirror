# Author: Dies <JerryCasiano(at)gmail(dot)com> 
# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Zaler <zldream1011(at)gmail(dot)com>
# Contributor: joni <kljohann(at)gmail(dot)com>

pkgname=font-manager-svn
_svnname=font-manager
pkgver=r416
pkgrel=1
pkgdesc="A simple font management application for Gtk+ Desktop Environments"
url="http://code.google.com/p/font-manager/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('subversion' 'gnome-common' 'yelp-tools' 'intltool' 'gobject-introspection' 'automake' 'autoconf' 'vala')
install=font-manager.install
provides=('font-manager')
conflicts=('font-manager')
source=("${_svnname}::svn+http://font-manager.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_svnname}
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}/${_svnname}

  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd ${srcdir}/${_svnname}

  make DESTDIR=${pkgdir} install
}
