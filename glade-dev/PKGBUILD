# Maintainer: Adam Hani Schakaki (krzd) <krzd@krzd.net>

_pkg=glade
pkgname=glade-dev
pkgver=3.9.2
pkgrel=1
pkgdesc="User interface builder for GTK+ and GNOME."
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'libxml2')
makedepends=('intltool' 'pkgconfig' 'gtk-doc')
conflicts=("${_pkg}")
provides=("${_pkg}=${pkgver}")
options=('!libtool')
url="http://glade.gnome.org/"
install=glade.install
source=("http://download.gnome.org/sources/${_pkg}/3.9/${_pkg}-${pkgver}.tar.bz2")
sha256sums=(`wget ${source/.t*}.sha256sum -qO - | grep tar.bz2 | cut -d " " -f1`)

build() {
  cd "${_pkg}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --disable-python
  make
}

package() {
  cd "${_pkg}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
