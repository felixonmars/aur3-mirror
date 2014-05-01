# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
vaver=va2010
pkgname=belastingdienst-$vaver
pkgver=1.20
pkgrel=1
pkgdesc="Verzoek of wijziging voorlopige aanslag 2010, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://belastingdienst.nl/"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('https://aur.archlinux.org/packages/be/belastingdienst-va2010/belastingdienst-va2010.tar.gz')
sha256sums=('7fc0892a03dcabed7d88d42e799107aef488855a7903df1d6b7c9293214b089d')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$vaver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$vaver/* ${pkgdir}/opt/belastingdienst/$vaver
  ln -s /opt/belastingdienst/$vaver/bin/${vaver}ux ${pkgdir}/usr/bin/${vaver}ux
}