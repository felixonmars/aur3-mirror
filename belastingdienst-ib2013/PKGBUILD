# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
# Contributor: jordz
ibver=ib2013
pkgname=belastingdienst-$ibver
pkgver=1.20
pkgrel=1
pkgdesc="Aangifteprogramma IB 2013, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext lib32-gcc-libs)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/ib2013_linux.tar.gz')
sha256sums=('589fde7d6a78429b634252ad9b82b095e5d33b2a69206f1900893e25ed7e89be')

package() 
{
  mkdir -p "${pkgdir}/opt/belastingdienst/$ibver"
  mkdir -p "${pkgdir}/usr/bin"

  cp -a "${srcdir}"/$ibver/* "${pkgdir}"/opt/belastingdienst/$ibver
  ln -s /opt/belastingdienst/$ibver/bin/ib2013ux "${pkgdir}"/usr/bin/
}
  