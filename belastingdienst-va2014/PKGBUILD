# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
vaver=va2014
pkgname=belastingdienst-$vaver
pkgver=1.10
pkgrel=1
pkgdesc="Verzoek of wijziging voorlopige aanslag 2014, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://belastingdienst.nl/"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/va2014_linux.tar.gz')
sha256sums=('77ea61bc51ca87e1a1f823fae84c76f93323f10b440256fce01351cfcc59e297')

package() 
{
  mkdir -p ${pkgdir}/opt/belastingdienst/$vaver
  mkdir -p ${pkgdir}/usr/bin

  cp -a ${srcdir}/$vaver/* ${pkgdir}/opt/belastingdienst/$vaver
  ln -s /opt/belastingdienst/$vaver/bin/${vaver}ux ${pkgdir}/usr/bin/${vaver}ux
}