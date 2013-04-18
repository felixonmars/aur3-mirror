# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=qle-quicklist-editor
pkgver=1.0.6
pkgrel=1
pkgdesc="Unity quicklist editor"
arch=('any')
url="http://www.vlijmweb.nl/qle/"
license=('GPL')
depends=('python3')
source=("http://ppa.launchpad.net/vlijm/qle/ubuntu/pool/main/q/qle/qle_${pkgver}.orig.tar.gz")
sha512sums=('662b006add89de26f67dfd7a1fc5293bbec945bcb4fb6158a921be820359c31641aced4d57301c5a3d666fb4ed6d5bd237251c91dca5ffbed2f411081734f0b1')

package() {
  cd "${srcdir}/qle-${pkgver}"

  install -dm755 "${pkgdir}"/usr/{bin,share/{applications,doc,pixmaps}}/
  install -m755 code/*.py "${pkgdir}"/usr/bin/
  cp -r qle_localsource/ "${pkgdir}"/usr/share/
  cp -r qle_doc/ "${pkgdir}"/usr/share/doc/${pkgname}/
  cp -r qle_pix/ "${pkgdir}"/usr/share/pixmaps/
  install -m644 miscellaneous/qlequicklist-editor.desktop \
    "${pkgdir}"/usr/share/applications/
}
