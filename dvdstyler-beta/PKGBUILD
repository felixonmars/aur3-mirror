# $Id: PKGBUILD 57686 2011-11-01 09:55:36Z ebelanger $
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Previous Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Previous Maintainer: Mario J Steele <mario@ruby-im.net>
# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=dvdstyler-beta
pkgver=2.4rc1
pkgrel=1
pkgdesc="Cross-platform DVD authoring application (beta)"
arch=('i686' 'x86_64')
url="http://www.dvdstyler.de/"
license=('GPL')
depends=('cdrkit' 'dvdauthor' 'dvd+rw-tools' 'wxgtk2.9' 'wxsvg' 'xine-ui' 'mjpegtools' 'libgnomeui' 'libexif')
makedepends=('zip' 'xmlto' 'docbook-xsl')
optdepends=('dvdisaster: ECC support')
options=('!makeflags')
conflicts=('dvdstyler')
source=(http://downloads.sourceforge.net/dvdstyler/dvdstyler-devel/${pkgver}/DVDStyler-${pkgver}.tar.bz2)
sha1sums=('a368aab73e74890ea2825519e446cd313d51ebca')

build() {
  cd "${srcdir}/DVDStyler-${pkgver}"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.9
  sed -i 's/libwxvilla.a/libwxvilla.a \/usr\/lib\/libjpeg.so.8/' src/Makefile
  make
}

package() {
  cd "${srcdir}/DVDStyler-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
