# Maintainer: Raphael Scholer <rscholer@gmx.de>
pkgname=mint-backgrounds-nadia-extra
pkgver=1.0
pkgrel=5
pkgdesc="Extra desktop backgrounds for Linux Mint 14 Nadia"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-nadia-extra"
license=('GPL3' 'CCPL:by' 'CCPL:by-sa')
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('6762faa68d9b42630dc4f3538f94ce89')

package() {
  cd "${pkgname}"
  cp -R ./usr "${pkgdir}"

  install -D -m 644 "${pkgdir}/usr/share/backgrounds/linuxmint-nadia-extra/Credits" \
  "${pkgdir}/usr/share/licenses/${pkgname}/Credits"
  rm "${pkgdir}/usr/share/backgrounds/linuxmint-nadia-extra/Credits"

}
# vim:set ts=2 sw=2 et:
