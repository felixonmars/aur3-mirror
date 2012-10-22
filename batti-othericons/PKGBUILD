# Maintainer: Philip Stark <git@codechaos.ch>

pkgname="batti-othericons"
pkg2name="batti"
pkgver="0.3.8"
pkgrel=1
pkgdesc="A simple battery monitor for the system tray. Patched for prettier icons and more resolution. Works best with Faenza"
arch=('any')
url="http://code.google.com/p/batti-gtk/"
license=('GPL')
depends=('dbus-python' 'pygtk' 'gtk2' 'upower')
optdepends=('notification-daemon: for power status notifications' 'xfce4-notifyd: alternative to notification-daemon')
conflicts=('batti')
provides=('batti')
install="$pkg2name.install"
source=("http://batti-gtk.googlecode.com/files/$pkg2name-$pkgver.tar.gz"
	"batti-icons.tar.bz2"
	"batti-patch-pretty-icons.diff")

package() {
    cd $srcdir
    patch -p0 < batti-patch-pretty-icons.diff
    cd "$srcdir/$pkg2name-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('4b239ead1643c95a6d89c380bc167781'
         'ff5ef0555850fa0a8acce52f7b370392'
         '591328c0868887d949b2fa31afa15c66')
