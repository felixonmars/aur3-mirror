# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=belastingdienst-ko2011
pkgver=1.0
pkgrel=2
pkgdesc="Aanvraag- en wijzigingsprogramma kinderopvangtoeslag 2011 voor Linux, Nederlandse belastingdienst."
arch=('any')
url="http://toeslagen.nl/particulier/kinderopvangtoeslag.html"
license=('custom')
#depends=()
options=('!strip')
source=(http://download.belastingdienst.nl/toeslagen/apps/linux/ko2011_linux.tar.gz)
md5sums=('f8c70544e9ac52d3acbc1f01bbe316f6')

build() {
  # Copy binaries
  cd "${srcdir}/ko2011"
  mkdir -p ${pkgdir}/opt/belastingdienst
  cp -a ${srcdir}/ko2011/* ${pkgdir}/opt/belastingdienst/
}

# vim:set ts=2 sw=2 et:
