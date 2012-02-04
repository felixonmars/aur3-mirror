# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gtkglarea-latest
pkgver=2.0.1
pkgrel=1
pkgdesc="GTK/GL Area libraries"
arch=('i686' 'x86_64')
url="http://mono-project.com/GtkGLArea"
license=('LGPL')
depends=('libgl' 'gtk2')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtkglarea/2.0/gtkglarea-${pkgver}.tar.gz)
md5sums=('2a81a86cfa80a920a5454dd00fad2e1d')

build() {
  cd ${srcdir}/gtkglarea-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd ${srcdir}/gtkglarea-${pkgver}
  make DESTDIR="${pkgdir}/" install || return 1
}
