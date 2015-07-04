# Contributor: kaptoxic@yahoo.com
# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=qldt
pkgver=1.1.11
pkgrel=1
pkgdesc="Small set of tools for managing, editing and viewing Quake Live and Quake 3 Arena demos"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qldt/"
license=('GPL3')
depends=(qt4)
install=qldt.install
md5sums=('ffffcded17b35dcdfa1b6376858b2303')
if [ "$CARCH" == "i686" ]; then
  source=(http://downloads.sourceforge.net/project/qldt/qldt/${pkgver}/qldt-${pkgver}-linux-x86.tar.gz)  
else
  source=(http://downloads.sourceforge.net/project/qldt/qldt/${pkgver}/qldt-${pkgver}-linux-x86_64.tar.gz)
fi

package() {
  cd ${srcdir}/qldt-${pkgver}/
  
  # Install
  install -m755 -d ${pkgdir}/usr/bin/
  install -m755 qldt ${pkgdir}/usr/bin/
  install -m755 qldtce ${pkgdir}/usr/bin/
  install -m755 -d ${pkgdir}/usr/share/icons/
  install -m644 desktop/quakelive_demo.png ${pkgdir}/usr/share/icons/qldt_icon.png
  install -m644 desktop/quakelive_cfg.png ${pkgdir}/usr/share/icons/qldtce_icon.png
  install -m755 -d ${pkgdir}/usr/share/applications/
  install -m644 desktop/*.desktop ${pkgdir}/usr/share/applications/
}

# vim:set ts=2 sw=2 et:
