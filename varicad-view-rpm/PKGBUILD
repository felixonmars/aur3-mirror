# Maintainer: Adam Hani Schakaki (krzd) <krzd@krzd.net>
pkgname=varicad-view-rpm
pkgver=2011_1.02
pkgrel=1
pkgdesc="Viewer VariCAD files. It can also open STEP (3D), DWG (2D), DXF (2D) and IGES (2D) files. (From RPM)"
arch=('i686' 'x86_64')
url="http://www.varicad.com/"
license=('custom')
depends=('hicolor-icon-theme' 'mesa' 'gtk2')
makedepends=(rpmextract)
source=(ftp://ftp.varicad.com/pub/VariCAD/en/linux/VariCAD_View_2011-en-1.02-1.i586.rpm)
[[ "$CARCH" == "x86_64" ]] && source=(ftp://ftp.varicad.com/pub/VariCAD/en/linux/VariCAD_View_2011-en-1.02-1.x86_64.rpm)
sha256sums=('5e886f3a639229b6066be7c7382fae243b11cc3e5beffaa45245185175d34054')
[[ "$CARCH" == "x86_64" ]] && sha256sums=('a8ead6b6323b2ddc52d1f577da9440086321a84b3a0a4fbcf96cf8544d50d6b4')

build() {
  cd "$srcdir"
  rpmextract.sh VariCAD_*-en-*.rpm
  cp -R opt usr $pkgdir
  cd "opt/VariCAD-View/desktop"
  install -Dm644 varicadview.desktop \
    ${pkgdir}/usr/share/applications/varicadview.desktop
  install -Dm644 x-varicadview.desktop \
    ${pkgdir}/usr/share/mimelnk/application/x-varicadview.desktop
  for i in 16x16 22x22 32x32 48x48; do
    install -Dm 644 varicadview_${i}.png \
      ${pkgdir}/usr/share/icons/hicolor/${i}/apps/varicadview.png
  done
  install -Dm 664 varicadview.xpm ${pkgdir}/usr/share/pixmaps/varicadview.xpm
  install -Dm 664 varicadview.xpm ${pkgdir}/usr/share/icons/varicadview.xpm
}

# vim:set ts=2 sw=2 et:

