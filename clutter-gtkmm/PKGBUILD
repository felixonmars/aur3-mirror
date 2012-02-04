# Maintainer: Filipp Andjelo <scorp@mailueberfall.de>

pkgname=clutter-gtkmm
pkgver=0.91.8
pkgrel=1
pkgdesc="C++ bindings for clutter-gtk"
arch=('i686' 'x86_64')
url='http://www.clutter-project.org'
license=('LGPL2.1')
depends=('gtkmm3' 'cluttermm' 'clutter-gtk')
options=(!libtool)
source=(http://ftp.gnome.org/pub/GNOME/sources/clutter-gtkmm/0.91/${pkgname}-${pkgver}.tar.xz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make all
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

md5sums=('7ba3bffae848a872b6f193763cd17642')
