# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
# Contributor: jordz
pkgname=belastingdienst-ib2011
pkgver=1.20
pkgrel=1
pkgdesc="Aangifteprogramma IB 2011, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/ib2011_linux.tar.gz')
sha256sums=('576ee69210f85d8b76cf31f530896aa3c7809b61567787b1877be2a99d1bfc8b')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/ib2011 
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/ib2011/* ${pkgdir}/opt/belastingdienst/ib2011
  ln -s /opt/belastingdienst/ib2011/bin/ib2011ux ${pkgdir}/usr/bin/
}
