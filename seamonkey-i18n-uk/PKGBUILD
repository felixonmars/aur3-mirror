# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
 
pkgname=seamonkey-i18n-uk
pkgver=2.31
pkgrel=1
_lang=uk
pkgdesc="Ukrainian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(ftp://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha1sums=('07ca2b4cbf585ce275240835788a2f12aeaa5709')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
