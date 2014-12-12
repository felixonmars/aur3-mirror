# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=hoppy
pkgver=1.8.1
pkgrel=2
pkgdesc='Python script to probe HTTP options and perform scanning for information disclosure issues'
arch=('any')
url='https://labs.portcullis.co.uk/tools/hoppy/'
license=('GPL2')
depends=('python2')
provides=('hoppy')
source=("https://labs.portcullis.co.uk/download/hoppy-${pkgver}.tar.bz2")
sha256sums=('53b44b8bf3d27b2de09648dcbf2419d1584012e025279db4e46059dad62f8b48')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e 's/python/python2/g' -i "${pkgname}"
  chmod 644 example-methods/goog
  chmod 644 example-methods/test
  chmod 644 example-methods/http-methods-withport
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}/lib"
  install -d "${pkgdir}/usr/share/${pkgname}/example-methods"
  install lib/hopclass.py "${pkgdir}/usr/share/${pkgname}/lib"
  cp example-methods/* "${pkgdir}/usr/share/${pkgname}/example-methods"
  install hoppy response-keywords http-methods "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/hoppy" "${pkgdir}/usr/bin/hoppy"
}
