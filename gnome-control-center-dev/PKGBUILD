# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributer: György Balló <ballogy@freestart.hu>

pkgname=gnome-control-center-dev
_pkgname=gnome-control-center
pkgver=3.10.2
pkgrel=1
pkgdesc="Development files for GNOME Control Center's library"
arch=(i686 x86_64)
depends=(gnome-control-center)
url="http://www.gnome.org"
license=('GPL')
source=(http://download.gnome.org/sources/$_pkgname/3.10/$_pkgname-$pkgver.tar.xz
        libgnome-control-center.pc)
sha256sums=('f67a9e88cda62c25e1aa1fbbb36d4fa632e8da11e98ac030e0e40437f12483a9'
            '98919b04e0262b5853723e7c516af560e8a710e0324e6d4e4e1ce9d5d238dee8')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm644 "$srcdir/libgnome-control-center.pc" "$pkgdir/usr/lib/pkgconfig/libgnome-control-center.pc"
  install -Dm644 shell/cc-panel.h "$pkgdir/usr/include/gnome-control-center-1/libgnome-control-center/cc-panel.h"
  install -Dm644 shell/cc-shell.h "$pkgdir/usr/include/gnome-control-center-1/libgnome-control-center/cc-shell.h"
}

