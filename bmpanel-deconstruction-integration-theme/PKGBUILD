# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=bmpanel-deconstruction-integration-theme
pkgver=20091217
pkgrel=1
pkgdesc="Theme deconstruction integration for bmpanel"
arch=('any')
url="http://www.box-look.org/content/show.php/deconstruction-integration?content=114308"
license=('GPL')
depends=('bmpanel')
source=(http://www.box-look.org/CONTENT/content-files/114308-deconstruction_integration.tar.gz)
md5sums=('c660b2c6f7e997a230c6d8aa39ca7b51')

build() {
  rm -R ${srcdir}/deconstruction_integration/gtk-2.0
  rm -R ${srcdir}/deconstruction_integration/openbox-3
  rm ${srcdir}/deconstruction_integration/*.png

  install -d ${pkgdir}/usr/share/bmpanel/themes/
  cp -r ${srcdir}/deconstruction_integration/bmpanel-theme/oi6 ${pkgdir}/usr/share/bmpanel/themes/ || return 1
}
