# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=vdr-mlist
_pluginname=mlist
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A VDR plugin that displays a list of all OSD-Messages shown since VDR start up"
url="http://www.joachim-wilke.de/vdr-mlist.htm"
license=('GPL2')
depends=('vdr>=1.7.42')
source=(http://www.joachim-wilke.de/downloads/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('82f240fa8c73f52383444e3e6f477466')

build() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_pluginname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install documents
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _file in README HISTORY; do
    install -m644 ${_file} "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}
