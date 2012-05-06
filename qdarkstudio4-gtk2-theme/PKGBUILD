# Contributor: Mr Green <mrgreen@archbang.org>

pkgname=qdarkstudio4-gtk2-theme
pkgver=20120506
pkgrel=2
pkgdesc="QDark Studio 4 Gtk2 Theme"
arch=('any')
url="http://luxieblack.deviantart.com/gallery/?q=qdark++icons#/d2lb7j0"
license=('Creative Commons') 
depends=('openbox')
source=(http://www.deviantart.com/download/156727260/QDark_Studio_by_LuxieBlack.gz)
md5sums=('a77f714ea46eaaa44e4ec372cf1d7c2b')

package() {
  cd "${srcdir}/"
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r ${srcdir}/QDarkStudio4 ${pkgdir}/usr/share/themes/
  find "$pkgdir/usr/share/themes/QDarkStudio4" -type f -executable -exec chmod 644 {} \;
  find "$pkgdir/usr/share/themes/QDarkStudio4"/ -name *~ -type f -exec rm -f '{}' \;
  find "$pkgdir/usr/share/themes/QDarkStudio4"/ -type d -exec chmod 755 '{}' \;
  chown -R root.root "$pkgdir/usr/share/themes/QDarkStudio4"/*
}

