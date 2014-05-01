# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
vaver=va2011
pkgname=belastingdienst-$vaver
pkgver=1.20
pkgrel=4
pkgdesc="Verzoek of wijziging voorlopige aanslag 2011, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://belastingdienst.nl/"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/va2011_linux.tar.gz')
sha256sums=('343eb74d45fbe4d992d166698c8ff8d14d08eee93beea5de5fb7f423ae27256d')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$vaver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$vaver/* ${pkgdir}/opt/belastingdienst/$vaver
  ln -s /opt/belastingdienst/$vaver/bin/${vaver}ux ${pkgdir}/usr/bin/${vaver}ux
}