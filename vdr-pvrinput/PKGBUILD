# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=vdr-pvrinput
pkgver=20081004
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="VDR-Plugin to use VDR with analogue Hauppauge PVR350 card as output device."
url="http://drseltsam.device.name/vdr/pvr/src/pvrinput/"
license=('GPL')
depends=('vdr')
source=(http://drseltsam.device.name/vdr/pvr/src/pvrinput/old/vdr-pvrinput-2008-10-04.tgz)
md5sums=('8a1363617094ac1a15b8adeef6165141')

build() {
  cd ${srcdir}/pvrinput-2008-10-04/

  mkdir -p "${pkgdir}/usr/lib/vdr"
  make VDRDIR=/usr/src/VDR LIBDIR="${pkgdir}/usr/lib/vdr" LOCALEDIR="${pkgdir}/usr/share/locale/" DESTDIR=$startdir/pkg || return 1
}
