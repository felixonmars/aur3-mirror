# Maintainer: Your Name <ricardo.gomez331@gmail.com>
pkgname=mkd
pkgver=0.1
pkgrel=3
pkgdesc="a way to handle the media keys ala gnome"
arch=(i686 x86_64)
url="http://code.google.com/p/mediakeys-daemon/"
license=('GPL')
depends=(dbus)
provides=(mkd)
source=(http://mediakeys-daemon.googlecode.com/files/mkd.py
        mkd.desktop)
md5sums=(8093c1ab590ea12ff86940550741e435
         6536d2ccd42fea621d52929dde2f5d06)

prepare() {
	cd "$srcdir/"
        sed -i 's|env python|env python2|' mkd.py
}

package() {
	cd "$srcdir/"
        install -Dm755 mkd.py "$pkgdir/usr/bin/mkd"
        install -Dm755 mkd.desktop "$pkgdir/etc/xdg/autostart/mkd.desktop"
}
