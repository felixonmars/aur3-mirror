# $Id$
# Maintainer: Kevin 
# Contributor: David K. dcrabs@archlinux.us

pkgname=netcfggui
_realname=netcfgGUI
pkgver=0.5
pkgrel=1
pkgdesc="A GUI for netcfg2"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/netcfgGUI?content=99509"
license=('GPL')
depends=('netcfg' 'wireless_tools' 'qt')

source=(http://www.kde-apps.org/CONTENT/content-files/99509-${_realname}_${pkgver}.tar.gz
        netcfggui.desktop)
md5sums=('4d5e8d66452d0a313ea77108578593d9'
         'c4d291635e9ff0ed4a14ba42d5ee853b')

build() {
  cd $srcdir/${_realname}
  qmake
  make
  install -Dm755 netcfgGUI ${pkgdir}/usr/bin/netcfgGUI
  install -Dm644 Network_Connection_Manager.png ${pkgdir}/usr/share/pixmaps/netcfgGUI.png
  install -Dm644 ${startdir}/netcfggui.desktop ${pkgdir}/usr/share/applications/netcfgGUI.desktop
}

# vim:set ts=2 sw=2 et:
