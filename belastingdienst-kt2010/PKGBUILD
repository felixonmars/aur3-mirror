# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=belastingdienst-kt2010
pkgver=1.0
pkgrel=1
pkgdesc="Aanvraag- en wijzigingsprogramma kindgebonden budget 2010 voor Linux, Nederlandse belastingdienst."
arch=('i686')
url="http://toeslagen.nl/particulier/kindgebonden_budget.html"
license=('custom')
#depends=()
options=('!strip')
source=(http://download.belastingdienst.nl/toeslagen/apps/linux/kt2010_linux.tar.gz)
md5sums=('393a19b3d2ff6ed6a870cf967e36ab01')

build() {
  # Copy binaries
  cd "${srcdir}/kt2010"
  mkdir -p ${pkgdir}/opt/belastingdienst
  cp -a ${srcdir}/kt2010/* ${pkgdir}/opt/belastingdienst/
}

# vim:set ts=2 sw=2 et:
