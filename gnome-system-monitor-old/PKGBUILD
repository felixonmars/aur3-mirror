# Maintainer: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor-old
pkgname_=gnome-system-monitor
pkgver=2.28.2
pkgrel=2
pkgdesc="A system monitor for GNOME (GTK2 version)"
arch=(i686 x86_64)
license=('GPL')
depends=('libwnck' 'libgtop' 'gtkmm' 'librsvg' 'gnome-icon-theme')
makedepends=('pkgconfig' 'gnome-doc-utils' 'intltool')
options=(!emptydirs)
url="http://www.gnome.org"
groups=('gnome-extra')
install=gnome-system-monitor.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname_}/${pkgver%.*}/${pkgname_}-${pkgver}.tar.bz2)
md5sums=('3f0bca9b0ebc7a365466851cd580d167')

build() {
  cd "${srcdir}/${pkgname_}-${pkgver}"

  # glib fixes:
  find ./src -type f -exec sed -i 's/#include <glib\/gtypes.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gmacros.*>/#include <glib.h>/g' {} \;
  find ./src -type f -exec sed -i 's/#include <glib\/gstring.*>/#include <glib.h>/g' {} \;
  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lgthread-2.0"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "${srcdir}/${pkgname_}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
