# Maintainer: Ricky Thomson <warzone at gmx dot co dot uk>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Maintainer: Marius Nestor <marius at softpedia dot com>

pkgname=glade3-gtk2
_pkgname=glade3
pkgver=3.8.4
pkgrel=1
pkgdesc="User interface builder for GTK+2 applications"
arch=('i686' 'x86_64')
url="http://glade.gnome.org/"
license=('GPL' 'LGPL')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libxml2')
makedepends=('intltool' 'python2' 'gtk-doc')
optdepends=('python2: python widgets support')
options=('!libtool')
install=${pkgname}.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('c7ae0775b96a400cf43be738b2f836663a505b1458255df9ce83a340057e3d08')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PYTHON="/usr/bin/python2"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
