# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=jtopen-jt400-jdbc4
pkgver=8.1
pkgrel=1
pkgdesc="A reduced package for JTOpen, providing only the JT400 library with JDBC 4.0 driver for IBM AS/400 and iSeries data and resources"
arch=(any)
url="http://jt400.sourceforge.net/"
license=('custom')
depends=(java-environment)
optdepends=()
provides=(jt400)
source=("http://downloads.sourceforge.net/project/jt400/JTOpen-full/${pkgver}/jtopen_${pkgver/\./_}.zip"
        "http://downloads.sourceforge.net/project/jt400/JTOpen-full/${pkgver}/jtopen_${pkgver/\./_}_jdbc40_jdk6.zip")
md5sums=('9416521312290086ca40214b04937a93'
         '270285536990f14e46e1941e9373be36')

package() {
  # Install files for the package
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" lib/jt400.jar

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.html

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" changes.html
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" readme.html
}

