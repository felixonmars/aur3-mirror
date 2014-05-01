# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
pkgname=belastingdienst-ib2010
pkgver=1.30
pkgrel=1
pkgdesc="Aangifteprogramma IB 2010, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/ib2010_linux.tar.gz')
sha256sums=('b94e7e729500879effc20f68dff09b13a1ef8d5529f68fae4f8720c44412d13d')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/ib2010
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/ib2010/* ${pkgdir}/opt/belastingdienst/ib2010
  ln -s /opt/belastingdienst/ib2010/bin/ib2010ux ${pkgdir}/usr/bin/
}
