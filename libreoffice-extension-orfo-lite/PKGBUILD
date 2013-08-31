# Maintainer: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=libreoffice-extension-orfo-lite
_extname=orfo4ooo-linux
pkgver=1.0
pkgrel=3
pkgdesc="Spell-checker of the Russian language (lite version)"
arch=('any')
url=("http://www.informatic.ru/")
license=('custom')
depends=('libreoffice-common')
makedepends=("unzip")
source=("http://orfo.ru/download/oo/${_extname}.oxt")
noextract=("${_extname}.oxt")
md5sums=('ee9dd4b1082630cd7029d4701bea4f5e')


package() {
#  unopkg add --shared "$srcdir"/orfo4ooo-linux.oxt

  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
  install -dm755 "${_DESTDIR}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  unzip -q "$srcdir"/${_extname}.oxt -d "${_DESTDIR}"
  install -m644 "${_DESTDIR}"license/*.txt ${pkgdir}/usr/share/licenses/"${pkgname}/"
  chmod -R g-w,o-w "${_DESTDIR}"
}

