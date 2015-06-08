# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=trid-defs
pkgver=2015.06.15
pkgrel=1
pkgdesc="Filesignature database for trid"
arch=('any')
url="http://mark0.net/soft-trid-e.html"
license=('CUSTOM')
source=(triddefs-${pkgver}.zip::http://mark0.net/download/triddefs.zip)
md5sums=('f5c8bb61533d13eaefefa0fd8a07b36e')

package() {
  cd "${srcdir}"

  install -D triddefs.trd "${pkgdir}/opt/trid/triddefs.trd"

  mkdir -p "${pkgdir}/usr/share/licenses/trid"
  ln -s "/usr/share/licenses/trid" "${pkgdir}/usr/share/licenses/${pkgname}"
}
