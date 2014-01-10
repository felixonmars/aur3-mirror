# Maintainer: PieterDeBruijn <aur@pieterdebruijn.nl>
waver=wa2010
pkgname=belastingdienst-$waver
pkgver=1.30
pkgrel=2
pkgdesc="Aangifteprogramma IB Ondernemers 2010, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/wa2010_linux.tar.gz')
sha256sums=('e388abce0c3280cfea11e9ec0f458231d87e7ff10bc567ac41f6903574dbeb89')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$waver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$waver/* ${pkgdir}/opt/belastingdienst/$waver
  ln -s /opt/belastingdienst/$waver/bin/${waver}ux ${pkgdir}/usr/bin/${waver}ux
}
