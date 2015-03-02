# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
ibver=ib2014
pkgname=belastingdienst-$ibver
pkgver=1.00
pkgrel=2
pkgdesc="Aangifteprogramma IB 2014, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext lib32-gcc-libs)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/ib2014_linux.tar.gz')
sha256sums=('59377aad00646718da9450d599db52dde661c71ee0542716aa8a09a3cdf8110e')

package() 
{
  mkdir -p "${pkgdir}/opt/belastingdienst/$ibver"
  mkdir -p "${pkgdir}/usr/bin"

  cp -a "${srcdir}"/$ibver/* "${pkgdir}"/opt/belastingdienst/$ibver
  ln -s /opt/belastingdienst/$ibver/bin/ib2014ux "${pkgdir}"/usr/bin/
}