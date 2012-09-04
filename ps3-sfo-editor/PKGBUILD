# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=ps3-sfo-editor
pkgver=1.0.0
pkgrel=2
pkgdesc="Linux GUI to view and edit PS3's PARAM.SFO files"
arch=('i686' 'x86_64')
url="http://www.psp-cheats.it/redsquirrel/"
license=('custom')
depends=('gambas2-gb-gui' 'gambas2-gb-form' 'gambas2-gb-gtk')
source=(ftp://ftp.gx-mod.com/ps3/pc/utilitaire/fichiers/PS3_SFO_Editor_LE.tar.bz2
        ps3-sfo-editor.desktop
        ps3-sfo-editor.png)
sha256sums=('77b01b89ad6fd0680ac64f94cf7b1179afa71b9b6469bcd5053097a8bd4ebab7
             559702663149aeeb57525c6d11e784c035e579f08265f68c8721da4c8e5b9953
             6d2167d5f62e259c24cabe04d53d8db1fb6622286630fef966420ba90a4c8d49')

build() {
  cd "${srcdir}"
  install -D -m755 ./PS3_SFO_Editor_LE.gambas "${pkgdir}/usr/bin/ps3-sfo-editor"
  install -D -m644 ./LEGGIMI "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/ps3-sfo-editor.desktop" "${pkgdir}/usr/share/applications/ps3-sfo-editor.desktop"
  install -D -m644 "${srcdir}/ps3-sfo-editor.png" "${pkgdir}/usr/share/pixmaps/ps3-sfo-editor.png"
}
