# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=vdr-pvr350
pkgver=20080907
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="VDR-Plugin to use VDR with analogue Hauppauge PVR350 card as output device."
url="http://drseltsam.device.name/vdr/pvr/src/pvr350/"
license=('GPL')
depends=('vdr' 'twolame' 'a52dec')

source=(http://drseltsam.device.name/vdr/pvr/src/pvr350/old/vdr-pvr350-2008-09-07.tgz)
md5sums=('3ffd38d2395687c6d19804b7b9f5e6df')

build() {
  cd ${srcdir}/pvr350-2008-09-07/

  mkdir -p "${pkgdir}/usr/lib/vdr"
  make VDRDIR=/usr/src/VDR LIBDIR="${pkgdir}/usr/lib/vdr" LOCALEDIR="${pkgdir}/usr/share/locale/" DESTDIR=$startdir/pkg || return 1
}
