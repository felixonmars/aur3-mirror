# Maintainer: Figue <ffigue@gmail.com>
# Based on firefox-18n package

lang=es-MX
pkgname=icecat-es-mx
pkgver=24.0
ffver=24.0
pkgrel=2
pkgdesc="es-MX language pack for IceCat"
arch=('any')
license=('MPL')
url="http://www.gnu.org/software/gnuzilla/"
depends=("icecat>=${pkgver}")
#_url=http://gnuzilla.gnu.org/download/langpacks/${pkgver}/GNU_IceCat-${pkgver}
_url=http://mirror.lnx.im/icecat/langpacks/${ffver}/
source=(${_url}${lang}.xpi)
md5sums=('1b98942795d8281211eb0a5dc50bc228')

# Don't extract anything
noextract=(${source[@]##*/})

package() {
  cd "${srcdir}"
  install -D -m 644 ${lang}.xpi "${pkgdir}/usr/lib/icecat/browser/extensions/langpack-${lang}@firefox.mozilla.org.xpi"
}

