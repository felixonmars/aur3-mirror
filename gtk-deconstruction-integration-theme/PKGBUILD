# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=gtk-deconstruction-integration-theme
pkgver=20091217
pkgrel=1
pkgdesc="Theme deconstruction integration for GTK2"
arch=('any')
url="http://www.box-look.org/content/show.php/deconstruction-integration?content=114308"
license=('GPL')
depends=('gtk2')
source=(http://www.box-look.org/CONTENT/content-files/114308-deconstruction_integration.tar.gz)
md5sums=('c660b2c6f7e997a230c6d8aa39ca7b51')

build() {
  rm -R ${srcdir}/deconstruction_integration/bmpanel-theme
  rm -R ${srcdir}/deconstruction_integration/openbox-3
  rm ${srcdir}/deconstruction_integration/*.png

  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/deconstruction_integration/ ${pkgdir}/usr/share/themes/ || return 1
}
