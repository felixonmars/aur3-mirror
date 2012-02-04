# Maintainer: Max Roder <maxroder at web dot de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=python-libchamplain
pkgver=0.6.1
pkgrel=5
pkgdesc="C library aimed to provide a Gtk+ widget to display rasterized maps(Python enabled version)"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/libchamplain/index.html"
license=('LGPL')
depends=('libsoup-gnome' 'pygtk' 'pygobject' 'pyclutter' 'pyclutter-gtk' )
options=('!libtool')
conflicts=('libchamplain')
source=(http://download.gnome.org/sources/libchamplain/0.6/libchamplain-${pkgver}.tar.gz)
md5sums=('9453c5fd41d7651285e9eefedaa96a9c')

build() {
  cd "${srcdir}/libchamplain-${pkgver}"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --enable-python=yes --enable-gtk
  make
}

package() {
  cd "${srcdir}/libchamplain-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
