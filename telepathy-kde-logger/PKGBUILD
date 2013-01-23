# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=telepathy-logger
pkgname=telepathy-kde-logger
pkgver=0.6.0
pkgrel=1
pkgdesc="Telepathy framework logging daemon. for KDE (without Gnome Dependencies)"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite' 'libxml2')
makedepends=('intltool' 'gobject-introspection')
conflicts=('telepathy-logger')
replaces=('telepathy-logger')
provides=('telepathy-logger')
options=('!libtool')
source=("http://telepathy.freedesktop.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('f453c49e53898c64bc423f0fdf117290')
install="${pkgname}.install"

build() {
  cd "${srcdir}"

  rm -fr "${_pkgname}-build"
  cp -R "${_pkgname}-${pkgver}" "${_pkgname}-build"
  cd "${_pkgname}-build"

  PYTHON="/usr/bin/python2" ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/telepathy --disable-static --disable-schemas-compile --enable-public-extensions --disable-gtk-doc-html
  make
}

package() {
  cd "${srcdir}/${_pkgname}-build"
  make DESTDIR="$pkgdir/" install
}
