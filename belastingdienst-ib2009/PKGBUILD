# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=belastingdienst-ib2009
pkgver=1.0
pkgrel=2
pkgdesc="Elektronische aangifte IB 2009 voor Linux, Nederlandse belastingdienst."
arch=('any')
url="http://belastingdienst.nl/particulier/aangifte2009/download/"
license=('custom')
#depends=()
options=('!strip')
source=(http://download.belastingdienst.nl/belastingdienst/apps/linux/ib2009_linux.tar.gz)
md5sums=('85a2ba10758101b57d344abc01e1e289')

build() {
  # Copy binaries
  cd "${srcdir}/ib2009"
  mkdir -p ${pkgdir}/opt/belastingdienst
  cp -a ${srcdir}/ib2009/* ${pkgdir}/opt/belastingdienst/
}

# vim:set ts=2 sw=2 et:
