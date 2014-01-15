# Maintainer: PieterDeBruijn <aur@pieterdebruijn.nl>
waver=wa2011
pkgname=belastingdienst-$waver
pkgver=1.10
pkgrel=1
pkgdesc="Aangifteprogramma IB Ondernemers 2011, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/wa2011_linux.tar.gz')
sha256sums=('d47bc464d20e1e9908cf5a7062a61aab5629fb55865e1d8f7ce3d988ae2d9225')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$waver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$waver/* ${pkgdir}/opt/belastingdienst/$waver
  ln -s /opt/belastingdienst/$waver/bin/${waver}ux ${pkgdir}/usr/bin/${waver}ux
}
