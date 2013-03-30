# Contributor: David Spicer <azleifel at gmail dot com>

pkgname=vdr-epgsearch-beta
_pluginname=epgsearch
pkgver=1.0.1.beta5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A VDR plugin providing a replacement schedule with extended functionality (Current Beta)"
url="http://winni.vdr-developer.org/epgsearch/"
license=('GPL2')
depends=('vdr>=1.7.42' 'perl' 'pcre')
provides=('vdr-epgsearch')
conflicts=('vdr-epgsearch')
backup=('var/lib/vdr/plugins/epgsearch/epgsearchcats.conf'
        'var/lib/vdr/plugins/epgsearch/epgsearchcmds.conf'
        'var/lib/vdr/plugins/epgsearch/epgsearchmenu.conf')
options=(emptydirs)
install=${pkgname}.install
source=(http://winni.vdr-developer.org/epgsearch/downloads/beta/vdr-${_pluginname}-${pkgver}.tgz)
md5sums=('6e63cc29df02f48fabf6e12e1e71b2fc')

build() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  make DESTDIR="${pkgdir}" install

  # Install scripts
  install -m755 scripts/*.{pl,sh} "${pkgdir}/usr/bin"
  find "${pkgdir}/usr/bin" -name "*.sh" -exec sed -i "s:\#\!/bin/bash:\#\!/usr/bin/bash:" '{}' \;

  # Install additional configuration files
  install -m644 scripts/*.conf "${pkgdir}${_vdrCONFDIR}/plugins/${_pluginname}"
  cp "${pkgdir}${_vdrCONFDIR}/plugins/${_pluginname}/epgsearchcats.conf-epgdata" \
     "${pkgdir}${_vdrCONFDIR}/plugins/${_pluginname}/epgsearchcats.conf"

  # Install documents (NB. They are also installed as man pages!)
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _file in README README.DE HISTORY HISTORY.DE MANUAL; do
    install -m644 ${_file} "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
