# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=minidlnad
pkgver=1.0
pkgrel=1
pkgdesc="Shortcut script to run a MiniDLNA daemon as a regular user, also autostart .desktop file."
arch=('any')
url="http://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('minidlna')
install=${pkgname}.install
source=('minidlnad'
        'minidlnad.desktop')
md5sums=('9194e042b349e3c5f11b3a5b28dc6d1e'
         '51159297195a2be4484d1985757bf1b7')

package() {
  install -Dm755 ${pkgname} $pkgdir/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop \
    $pkgdir/usr/share/doc/${pkgname}/${pkgname}.desktop
}
# vim:set ts=2 sw=2 et:
