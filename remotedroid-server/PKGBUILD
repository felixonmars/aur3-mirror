# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=remotedroid-server
pkgver=1.5
pkgrel=2
pkgdesc="Turns your Android phone into a wireless keyboard and mouse with touchpad"
arch=('any')
url="http://www.remotedroid.net"
license=('GPL')
depends=('java-runtime')
source=("http://www.remotedroid.net/RemoteDroidServer_v$pkgver.zip"
        'remotedroid-server.desktop'
        'remotedroid-server'
        'remotedroid.png')
md5sums=('14ec6395857ef852cd29af7857b43647'
         'b817932156fbf95d64420ef22d995dd1'
         '782d0158e70cf928f2a18a7dd56301f2'
         '0b7715afe6a9d43853bc16b6ee892fb0')

package() {
 install -Dm 755 "$srcdir/RemoteDroidServer/RemoteDroidServer.jar" "$pkgdir/usr/share/java/RemoteDroidServer.jar"
 install -Dm 644 "$srcdir/remotedroid-server.desktop" "$pkgdir/usr/share/applications/remotedroid-server.desktop"
 install -Dm 644 "$srcdir/remotedroid.png" "$pkgdir/usr/share/pixmaps/remotedroid.png"
 install -Dm 755 "$srcdir/remotedroid-server" "$pkgdir/usr/bin/remotedroid-server"
}
