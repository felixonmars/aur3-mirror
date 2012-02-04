# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=belastingdienst-hz2010
pkgver=1.0
pkgrel=3
pkgdesc="Aanvraag- en wijzigingsprogramma huur- en zorgtoeslag 2010 voor Linux, Nederlandse belastingdienst."
arch=('any')
url="http://toeslagen.nl/"
license=('custom')
#depends=()
options=('!strip')
source=(http://download.belastingdienst.nl/toeslagen/apps/linux/hz2010_linux.tar.gz)
md5sums=('b9cbd6068f69a9b2606d4ee6748c41de')

build() {
  # Copy binaries
  cd "${srcdir}/hz2010"
  mkdir -p ${pkgdir}/opt/belastingdienst
  cp -a ${srcdir}/hz2010/* ${pkgdir}/opt/belastingdienst/
}

# vim:set ts=2 sw=2 et:
