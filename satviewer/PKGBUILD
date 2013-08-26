# Contributor: moostik <mooostik_at_gmail.com>

pkgname=satviewer
pkgver=201
pkgrel=1
pkgdesc="Satellite tracking tool"
arch=('i686' 'x86_64')
url="http://satviewer.net/"
license=('GPL3')
depends=('qt4' 'mesa')
source=("https://${pkgname}.googlecode.com/files/src${pkgver}.tgz"
	"${pkgname}.desktop"
	"${pkgname}.sh")
md5sums=('f33be6fc9316260b577aab1e6a36fd83'
         '70fd11e47233f5116cb09ed4ed00a02c'
         'be0dc35a489563c1d16b0df004efb43c')

build() {
  cd "${srcdir}/src${pkgver}"
  qmake-qt4 SatViewer.pro
  make
}

package() {
  cd "${srcdir}/src${pkgver}/bin"
  install -D -m755 SatViewer "${pkgdir}/opt/${pkgname}/SatViewer"
  cp -r profile plugins "${pkgdir}/opt/${pkgname}/"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/satviewer"

  # Install shortcut and icon
  install -D -m644 "profile/icons/sat.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
