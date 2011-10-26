# Maintainer: Romain Schmitz <slopjong [[at]] hackerspace [[dot]] lu>
pkgname=inkscape-table
pkgver=(1.0)
pkgrel=2
pkgdesc="Provides table support for Inkscape."
arch=('i686' 'x86_64')
url="http://inkscape-tables.sourceforge.net"
license=('GPL')
depends=('inkscape')
makedepends=('python')
install=inkscape-table.install
changelog=${pkgname}.changelog
source=(${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/sourceforge/inkscape-tables/$pkgname-$pkgver.tar.gz)
md5sums=(a373048ae0fe8417d4f699ba4d8e3a9e)

package() {

  mkdir -p ${pkgdir}/usr/share/inkscape/extensions
  mkdir -p ${pkgdir}/usr/share/doc/inkscape-table
  
  cp ${srcdir}/${pkgname}-${pkgver}/modules/* ${pkgdir}/usr/share/inkscape/extensions
  install -m644 ${srcdir}/${pkgname}-${pkgver}/README "${pkgdir}/usr/share/doc/inkscape-table/README"

  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir /tmp/inkscape-table
  cp install_shortcuts.py /tmp/inkscape-table
  cp keys.xml /tmp/inkscape-table
}

# vim:set ts=2 sw=2 et:
