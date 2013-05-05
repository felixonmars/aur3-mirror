# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
vaver=va2012
pkgname=belastingdienst-$vaver
pkgver=1.20
pkgrel=1
pkgdesc="Verzoek of wijziging voorlopige aanslag 2012, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://belastingdienst.nl/"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/va2012_linux.tar.gz')
sha256sums=('a84e8b76295477e8173a76b056ea9ac3ba2c392301df7231541498f331e1b385')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$vaver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$vaver/* ${pkgdir}/opt/belastingdienst/$vaver
  ln -s /opt/belastingdienst/$vaver/bin/${vaver}ux ${pkgdir}/usr/bin/${vaver}ux
}