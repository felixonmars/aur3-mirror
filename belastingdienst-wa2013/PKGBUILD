# Maintainer: Pieter de Bruijn <aur@pieterdebruijn.nl>
_waver=wa2013
pkgname=belastingdienst-${_waver}
pkgver=1.20
pkgrel=1
pkgdesc="Aangifteprogramma IB Ondernemers 2013, Nederlandse belastingdienst"
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext lib32-gcc-libs)
fi

options=('!strip')
source=('http://download.belastingdienst.nl/belastingdienst/apps/linux/wa2013_linux.tar.gz')
sha256sums=('42e9f2e6b2ea93381b332dfe5d8d0912fb9e920209a4270d1fbb53f172320b71')

package() 
{
  mkdir -p "${pkgdir}/opt/belastingdienst/${_waver}"
  mkdir -p "${pkgdir}/usr/bin"

  cp -a "${srcdir}"/${_waver}/* "${pkgdir}"/opt/belastingdienst/${_waver}
  ln -s /opt/belastingdienst/${_waver}/bin/${_waver}ux "${pkgdir}"/usr/bin/${_waver}ux
}
