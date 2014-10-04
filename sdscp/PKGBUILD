# Maintainer: Ondřej Hruška <ondra@ondrovo.com>

pkgname='sdscp'

pkgver=1.3.2
pkgrel=1

pkgdesc="External preprocessor and pre-compiler for SDS-C (by AN-D.cz)"
arch=('any')
url='https://github.com/MightyPork/sdscp'
license=('GPL2')

depends=('python3')

makedepends=('git')

source=('git+https://github.com/MightyPork/sdscp.git')
provides=('sdscp')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's|-|.|g'
}

package() {
  # install license
  install -Dm 644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install files in /usr/share
  mkdir "${pkgdir}/usr/share/${pkgname}/"

  cp -pR ${srcdir}/${pkgname}/* ${pkgdir}/usr/share/${pkgname}/

  # install link in /usr/bin
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/share/${pkgname}/sdscp" "${pkgdir}/usr/bin/sdscp"
}
