# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=belastingdienst-ko2010
pkgver=1.0
pkgrel=3
pkgdesc="Aanvraag- en wijzigingsprogramma kinderopvangtoeslag 2010 voor Linux, Nederlandse belastingdienst."
arch=('any')
url="http://toeslagen.nl/particulier/kinderopvangtoeslag.html"
license=('custom')
#depends=()
options=('!strip')
source=(http://download.belastingdienst.nl/toeslagen/apps/linux/ko2010_linux.tar.gz)
md5sums=('8d2422b31366e3f7fc7ec00c86cd9e7f')

build() {
  # Copy binaries
  cd "${srcdir}/ko2010"
  mkdir -p ${pkgdir}/opt/belastingdienst
  cp -a ${srcdir}/ko2010/* ${pkgdir}/opt/belastingdienst/
}

# vim:set ts=2 sw=2 et:
