pkgname=telepathy-kde-mission-control
_pkgname=telepathy-mission-control
pkgver=5.14.0
pkgrel=3
pkgdesc="A Telepathy component providing abstraction of some of the details of connection managers. for KDE (without Gnome Dependencies)"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/Mission Control"
license=('LGPL2.1')
depends=('telepathy-glib')
makedepends=('libxslt' 'python2')
conflicts=('telepathy-mission-control')
replaces=('telepathy-mission-control')
provides=('telepathy-mission-control')
install="${pkgname}.install"
options=('!libtool')
source=("http://telepathy.freedesktop.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('483fa8860891815a540ecf1bb9155122')

build() {
  cd "${srcdir}"

  rm -fr "${_pkgname}-build"
  cp -R "${_pkgname}-${pkgver}" "${_pkgname}-build"
  cd "${_pkgname}-build"

  PYTHON="/usr/bin/python2" ./configure --prefix=/usr --libexecdir=/usr/lib/telepathy --disable-schemas-compile --disable-gnome-keyring --disable-conn-setting
  make
}

package() {
  cd "${_pkgname}-build"
  make DESTDIR="${pkgdir}" install
}