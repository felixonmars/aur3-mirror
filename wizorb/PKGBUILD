# Maintainer: TastyPi <grogers3.14@gmail.com>
pkgname=wizorb
pkgver=1.1
pkgrel=1
pkgdesc="An all-new block-breaking game set in a fantasy world. (Requires copy of game)"
arch=('any')
url="http://www.wizorb.com/"
license=('custom: "commercial"')
depends=('mono' 'openal')
source=("${pkgname}.sh"
        "${pkgname}.desktop")

md5sums=('878fe49b0b4902c78e859024ada0a462'
         '2c55b8792efa788595bbb57a164df216')

if [[ "$CARCH" -eq x86_64 ]]; then
  source=("${source[@]}" "file://${pkgname}_${pkgver}_amd64.tar")
  md5sums=("${md5sums[@]}" 'ccb9283186f0b7395b7e04f179fb5b76')
else
  source=("${source[@]}" "file://${pkgname}_${pkgver}_i386.tar")
  md5sums=("${md5sums[@]}" 'b9ad77d4792ec5908a445b41d949a5e1')
fi

build() {
  true #functions can't be empty in bash
}

package() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${pkgname}/* ${pkgdir}/opt/${pkgname}
  install -d ${pkgdir}/usr/bin
  install ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -d ${pkgdir}/usr/share/applications
  install ${pkgname}.desktop ${pkgdir}/usr/share/applications
}

