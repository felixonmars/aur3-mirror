#Maintainer: aaditya	  aaditya_gnulinux@zoho.com

pkgname=timeset-gui
pkgver=1.6
pkgrel=2
pkgdesc="A python-gui for managing system date and time."
url="http://forum.manjaro.org/index.php?topic=7067.0"
arch=('any')
license=('GPL')
depends=('gksu' 'python' 'python-gobject' 'pywebkitgtk')
optdepends=('ntp')
source=("http://git.manjaro.org/aadityabagga/timeset-gui/repository/archive")
sha1sums=('SKIP')
package() {
  cd "${srcdir}/${pkgname}.git"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "time-admin.png" "${pkgdir}/usr/share/icons/timeset-gui-icon.png"
  install -Dm755 "TimeSettings.desktop" "${pkgdir}/usr/share/applications/TimeSettings.desktop"
}

# vim:set ts=2 sw=2 et:
