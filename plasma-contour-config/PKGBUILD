# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-contour-config
pkgver=0.2.13
pkgrel=2
pkgdesc="A set of configurations file to run the Plasma Active Contour shell"
arch=('any')
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-mobile' 'share-like-connect' 'declarative-plasmoids' 'kde-artwork-active')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/2.0/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=('f0f24f3847c86d2e4c2b255562ce106b')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  install -d "${pkgdir}"/usr/share/config
  cp -rf *rc kdeglobals lowspacesuse mysql-local.conf emaildefaults \
    "${pkgdir}"/usr/share/config/

  # Fix permissions
  chmod 644 "${pkgdir}"/usr/share/config/kwinrulesrc

  install -d "${pkgdir}"/usr/share/autostart
  cp -rf *.desktop "${pkgdir}"/usr/share/autostart/

  # Fix conflicts
  rm "${pkgdir}"/usr/share/autostart/{krunner,plasma-desktop}.desktop
}
