# Maintainer: Christian Föller <kirisutojan@gmail.com>
 
pkgname=dvb-cines2-fw
pkgver=1.0
pkgrel=2
pkgdesc="Firmware for Digital Devices / Linux4Media CineS2 DVB-S2 PCIe Card"
arch=('any')
url="http://www.linuxtv.org/wiki/index.php/Linux4Media_cineS2_DVB-S2_Twin_Tuner"
license=('unknown')
 
source=('http://l4m-daten.de/downloads/firmware/dvb-s2/linux/all/ngene_15.fw' 
        'http://l4m-daten.de/downloads/firmware/dvb-s2/linux/all/ngene_17.fw'
	      'http://l4m-daten.de/downloads/firmware/dvb-s2/linux/all/ngene_18.fw')
md5sums=('d798d5a757121174f0dbc5f2833c0c85'
         '26b687136e127b8ac24b81e0eeafc20b'
         'ebce3ea769a53e3e0b0197c3b3f127e3')
 
package() {
  install -Dm0644 $srcdir/ngene_15.fw $pkgdir/lib/firmware/ngene_15.fw
  install -Dm0644 $srcdir/ngene_18.fw $pkgdir/lib/firmware/ngene_17.fw
  install -Dm0644 $srcdir/ngene_18.fw $pkgdir/lib/firmware/ngene_18.fw
}
 
# vim:set ts=2 sw=2 et:
