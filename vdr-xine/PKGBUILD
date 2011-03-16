# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>
# Maintainer: David Spicer <azleifel at googlemail dot com>

pkgname=vdr-xine
_pluginname=xine
pkgver=0.9.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A VDR plugin that allows VDR to be used with budget cards"
url="http://sourceforge.net/projects/xine/"
license=('GPL2')
depends=('vdr' 'xine-lib-vdr')
makedepends=('pkgconfig')
install=${pkgname}.install
source=(http://home.vrweb.de/rnissl/${pkgname}-${pkgver}.tgz
        vdr-xine.desktop)
md5sums=('0374123d6991f55d91122b020361d8f6'
         '20080b5e0aa3e848d56d363e4a7fdf95')

build() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  # Assumed VDR directory environment (VDRDIR/Make.config):
  # MANDIR       = /usr/share/man
  # BINDIR       = /usr/bin
  # LOCDIR       = /usr/share/locale
  # PLUGINLIBDIR = /usr/lib/vdr
  # VIDEODIR     = /var/spool/video
  # CONFDIR      = /etc/vdr

  install -d -m755 "${pkgdir}/etc/vdr/plugins/${_pluginname}"
  install -d -m755 "${pkgdir}/usr/lib/vdr"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/locale"
  
  make VDRDIR="/usr/include/vdr" \
       LIBDIR="${pkgdir}/usr/lib/vdr" \
       LOCALEDIR="${pkgdir}/usr/share/locale" all
  
  cp -Rp data/* "${pkgdir}/etc/vdr/plugins/xine"
  
  # Install documents
  for _file in README HISTORY MANUAL; do
    install -m644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}"
  done

  # Install homebrew desktop file
  install -D -m644 "${startdir}/vdr-xine.desktop" "${pkgdir}/usr/share/applications/vdr-xine.desktop"
}
