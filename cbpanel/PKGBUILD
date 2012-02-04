pkgname=cbpanel
pkgver=0.3
pkgrel=1
pkgdesc="Crunchbang Panel"
arch=('any')
url="http://crunchbanglinux.org/forums/topic/2515/crunchbang-panel/page/1/"
license=('unknown')
depends=('gnome-python-desktop')
source=(http://www.ad-comp.be/public/projets/cbpanel/${pkgname}.${pkgver}.tar.bz2)
md5sums=('b50de6e1d6469120bcdc742f2a38319d')

build() {
  mkdir -p ${pkgdir}/usr/share/cbpanel
  mkdir -p ${pkgdir}/usr/bin
  cp -R ${srcdir}/${pkgname}/* ${pkgdir}/usr/share/cbpanel/
  rm ${pkgdir}/usr/share/cbpanel/control-install
  rm ${pkgdir}/usr/share/cbpanel/make_deb.sh
  ln -s /usr/share/cbpanel/cbpanel ${pkgdir}/usr/bin
}
