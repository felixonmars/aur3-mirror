# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
vaver=va2013
pkgname=belastingdienst-$vaver
pkgver=1.10
pkgrel=1
pkgdesc="Verzoek of wijziging voorlopige aanslag 2013, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://belastingdienst.nl/"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/va2013_linux.tar.gz')
md5sums=('e4170a2942e3e79776f852da898405f7')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$vaver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$vaver/* ${pkgdir}/opt/belastingdienst/$vaver
  ln -s /opt/belastingdienst/$vaver/bin/${vaver}ux ${pkgdir}/usr/bin/${vaver}ux
}