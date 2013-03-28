# Contributor: David Spicer <azleifel at gmail dot com>

pkgname=vdr-wirbelscancontrol
_pluginname=wirbelscancontrol
pkgver=0.0.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Scan channels using the wirbelscan VDR plugin"
url="http://wirbel.htpc-forum.de/wirbelscan/index2.html"
license=('GPL2')
depends=('vdr>=1.7.42' 'vdr-wirbelscan>=0.0.5')
options=('!emptydirs')
source=(http://wirbel.htpc-forum.de/${_pluginname}/${pkgname}-${pkgver}.tgz)
md5sums=('e47afd1e9147c69b4656f4f54c9ec9f6')

package() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  # Create install directories
  install -d -m755 "${pkgdir}${_vdrLIBDIR}"
  install -d -m755 "${pkgdir}${_vdrLOCDIR}"
  
  # Create install directories
  install -d -m755 "${pkgdir}${_vdrLIBDIR}"
  install -d -m755 "${pkgdir}${_vdrLOCDIR}"

  rm wirbelscan_services.h
  sed -i -e 's|"wirbelscan_services.h"|<vdr/wirbelscan_services.h>|' scanmenu.c
  sed -i -e 's|"wirbelscan_services.h"|<vdr/wirbelscan_services.h>|' scanmenu.h
  make LIBDIR="${pkgdir}${_vdrLIBDIR}" \
       LOCALEDIR="${pkgdir}${_vdrLOCDIR}" \
       VDRDIR="${_vdrINCDIR}/vdr" \
       all
  
  # Install documents
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _file in README HISTORY; do
    install -m644 ${_file} "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}
