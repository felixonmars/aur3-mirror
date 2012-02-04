# Maintainer: Figue <ffigue@gmail.com>
# Based on icecat-i18n package

lang=as
pkgname=icecat-as
pkgver=3.6.15
pkgrel=1
pkgdesc="as language pack for IceCat"
arch=('any')
license=('MPL')
url="http://www.gnu.org/software/gnuzilla/"
depends=("icecat>=${pkgver}g1")
#_url=http://gnuzilla.gnu.org/download/langpacks/${pkgver}/GNU_IceCat-${pkgver}
_url=http://mirror.linuzeros.org/icecat/langpacks/${pkgver}/
source=(${_url}${lang}.xpi)

build() {
  cd "${srcdir}"
  for langfile in *.xpi; do
    lang=${langfile/.xpi/}
    msg "Building ${langfile}"
    bsdtar xf ${langfile} || return 1
    sed -i "s|jar:chrome/${lang}.jar|jar:${lang}.jar|" chrome.manifest || return 1
    install -D -m 644 chrome/${lang}.jar "${pkgdir}/usr/lib/icecat/chrome/${lang}.jar" || return 1
    install -D -m 644 chrome.manifest "${pkgdir}/usr/lib/icecat/chrome/${lang}.manifest" || return 1
  done
}

md5sums=('b837d1f97a180f064367eb7dba2c325a')
