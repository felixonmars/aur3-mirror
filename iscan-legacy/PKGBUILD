# Contributor & Maintainer: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=iscan-legacy
pkgver=2.10.0
pkgrel=1
pkgdesc="A legacy version of the front-end for EPSON scanner/all-in-ones"
arch=('i686')
url="http://www.avasys.jp/english/linux_e/dl_scan.html"
license=('GPL2' 'LGPL2' 'EAPL' 'EPSON')
depends=('gtk2' 'libstdc++5' 'sane')
makedepends=('rpmextract')
conflicts=('iscan')
replaces=('iscan')
backup=('etc/sane.d/epkowa.conf')
install=${pkgname}.install
options=('!libtool')
source=(http://lx1.avasys.jp/iscan/${pkgver}/iscan-${pkgver}-1.c2.i386.rpm \
        epkowa.conf iscan.png iscan.desktop iscan-legacy.install)
md5sums=('349715562010b0905b0a2aa6c758fb85' '8a82eaf3fdc720e6f424ab30a6bae47b'
	 '9dc7e21aae4bd7d1c4ca96cfa3dafaa7' '82a67a6ad8d2464492106797f5acab55'
	 '4ee20befa714510a0757d7c5f0dd3ff7')

build() {
  cd $startdir/src
  rpmextract.sh iscan-${pkgver}-1.c2.i386.rpm
  install -d $startdir/pkg || return 1
  cp -r $startdir/src/usr $startdir/pkg/
  install -Dm644 ${srcdir}/epkowa.conf ${pkgdir}/etc/sane.d/epkowa.conf
  install -Dm644 ${srcdir}/iscan.png ${pkgdir}/usr/share/pixmaps/iscan.png
  install -Dm644 ${srcdir}/iscan.desktop ${pkgdir}/usr/share/applications/iscan.desktop
}
