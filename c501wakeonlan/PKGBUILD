# Submitter Rolinh <robinDOThahlingATgw-computingDOTnet>
# Maintainer: barton <barton bcdesignswell com>
pkgname=c501wakeonlan
pkgver=1.0.6
pkgrel=2
pkgdesc="Wake on LAN tool with a GUI"
arch=('x86_64' 'i686')
url="http://en.congelli.eu/prog_info_c501wakeonlan.html"
license=('GPL3')
depends=('wxgtk')
#      http://en.congelli.eu/download/c501wakeonlan/c501wakeonlan-1.0.6.tar.gz
source=(http://fr.congelli.eu/directdl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4e7a7c26926575ffbae386834923628f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
#   cd "src"
#   tar xzf "${pkgname}-${pkgver}.tar.gz"
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
