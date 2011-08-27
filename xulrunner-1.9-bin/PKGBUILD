# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=xulrunner-1.9-bin
pkgver=1.9.2.19
pkgrel=1
pkgdesc="Mozilla's application framework."
arch=('i686')
url="https://developer.mozilla.org/en/XULRunner_1.9.2_Release_Notes"
license=('GPL' 'LGPL' 'MPL')
depends=(alsa-lib dbus-glib gcc-libs gtk2 hunspell libevent libidl2 libnotify libxrender libxt mime-types mozilla-common nss sqlite3 startup-notification)
provides=(xulrunner-1.9)
conflicts=(xulrunner-1.9)
source=(http://releases.mozilla.org/pub/mozilla.org/xulrunner/releases/1.9.2.19/runtimes/xulrunner-1.9.2.19.en-US.linux-i686.tar.bz2)
md5sums=('f41d30aee474fb82cf9956ff20dea683')

build() {
    true
}

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -r "$srcdir/xulrunner" "$pkgdir/opt"
    ln -s "/opt/xulrunner/xulrunner" "$pkgdir/usr/bin/xulrunner-1.9"
}
