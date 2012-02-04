# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=simple-scan2
_pkgname=${pkgname/2/}
pkgver=2.32.0.2
pkgrel=1
pkgdesc='Simple scanning utility'
arch=('i686' 'x86_64')
url='http://launchpad.net/simple-scan'
license=('GPL3')
depends=('sane' 'gconf')
makedepends=('gnome-doc-utils' 'intltool')
conflicts=('simple-scan')
install="${_pkgname}.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('8435b0a31aba1255caf685eb57b18e06')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --disable-schemas-install

  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
