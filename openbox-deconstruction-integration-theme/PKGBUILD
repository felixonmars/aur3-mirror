# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-deconstruction-integration-theme
pkgver=20091215
pkgrel=1
pkgdesc="deconstruction integration OpenBox Theme"
arch=('any')
url="http://www.box-look.org/content/show.php/deconstruction-integration?content=114308"
license=('GPL')
depends=('openbox')
source=(http://www.box-look.org/CONTENT/content-files/114308-deconstruction_integration.tar.gz)
md5sums=('c660b2c6f7e997a230c6d8aa39ca7b51')

build() {
  rm -R ${srcdir}/deconstruction_integration/bmpanel-theme
  rm -R ${srcdir}/deconstruction_integration/gtk-2.0
  rm ${srcdir}/deconstruction_integration/*.png

  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/deconstruction_integration/ ${pkgdir}/usr/share/themes/ || return 1
}
