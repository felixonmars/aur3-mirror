# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Zac Brown <rufius@gmail.com>
# Contributor: Malte Schwarting <m.schwarting@gmx.net>

pkgname=gecko-sdk
pkgver=31.0
pkgrel=1
pkgdesc="SDK for Gecko Engine"
url="http://developer.mozilla.org/en/docs/Gecko_SDK"
arch=('i686' 'x86_64')
license=('MPL')
depends=(gnome-vfs xulrunner)
optdepends=(libnotify)
source=(http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/${pkgver}/sdk/xulrunner-${pkgver}.en-US.linux-${CARCH}.sdk.tar.bz2)

md5sums=('e20ce46e69ed36e20aa4faefe3022698')
[[ "$CARCH" == "x86_64" ]] && md5sums[0]="548ff61bb3a45d0bf645eee7f46e8024"

package() {
        mkdir -p $pkgdir/opt/gecko-sdk
        mv  $srcdir/xulrunner-sdk/* $pkgdir/opt/gecko-sdk/
}

