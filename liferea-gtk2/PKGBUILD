# Maintainer: Alad Wenter <alad@linuxbbq.org>

pkgname=liferea-gtk2
pkgver=1.8.16
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs (GTK2 version)"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'gconf' 'libunique' 'libxml2' 'libxslt' 'sqlite' 'webkitgtk2' 'json-glib' 'libnotify')
provides=('liferea')
conflicts=('liferea')
makedepends=('intltool')
options=('!emptydirs')
install=liferea.install
source=(https://github.com/lwindolf/liferea/releases/download/v${pkgver}/liferea-${pkgver}.tar.bz2)
sha256sums=('ef0bd06baf1b04f9351c909a9e9c7cd9aeea46f423354c590ab5a9b5d7cb747b')

build() {
  cd liferea-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd liferea-${pkgver}
  make DESTDIR="${pkgdir}" install
}
