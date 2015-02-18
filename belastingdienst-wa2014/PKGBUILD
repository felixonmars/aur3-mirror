# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
_waver=wa2014
pkgname=belastingdienst-${_waver}
pkgver=1.00
pkgrel=1
pkgdesc="Aangifteprogramma IB Ondernemers 2014, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext lib32-gcc-libs)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/wa2014_linux.tar.gz')
sha256sums=('e5c2ecbe58488b00f3bcdec8c242171faa1702331ee738b35f20064ab8b8bf77')

package() 
{
  mkdir -p "${pkgdir}/opt/belastingdienst/${_waver}"
  mkdir -p "${pkgdir}/usr/bin"

  cp -a "${srcdir}"/${_waver}/* "${pkgdir}"/opt/belastingdienst/${_waver}
  ln -s /opt/belastingdienst/${_waver}/bin/${_waver}ux "${pkgdir}"/usr/bin/${_waver}ux
}
