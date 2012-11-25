# Maintainer: Romuald Texier-Marcadé <rtexier@elikya.com>
pkgname=tablix2
pkgver=0.3.5
pkgrel=1
pkgdesc="Free software for solving timetabling problems."
url="http://www.tablix.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libxml2' 'bash')
makedepends=()
conflicts=()
replaces=()
backup=()
options=('!libtool')

source=("http://www.tablix.org/releases/stable/${pkgname}-${pkgver}.tar.gz")
md5sums=('87f727ea5daa410c9bf293ab945e9bd7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share --localedir=/usr/share/locale --datadir=/usr/share --sysconfdir=/etc 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/locale ${pkgdir}/usr/share
}
