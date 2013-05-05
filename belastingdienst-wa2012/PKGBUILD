 # Maintainer: PieterDeBruijn <aur@pieterdebruijn.nl>
waver=wa2012
pkgname=belastingdienst-$waver
pkgver=1.10
pkgrel=3
pkgdesc="Aangifteprogramma IB Ondernemers 2012, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/wa2012_linux.tar.gz')
sha256sums=('5e34caccfcaeafc17f828f0cadb08ed8280052f19d485b9f7b3d3e9ece303e94')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$waver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$waver/* ${pkgdir}/opt/belastingdienst/$waver
  ln -s /opt/belastingdienst/$waver/bin/${waver}ux ${pkgdir}/usr/bin/${waver}ux
}
