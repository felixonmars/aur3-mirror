# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=thinkblinkd
pkgver=0.1.7
pkgrel=1
pkgdesc="thinkblinkd is a python daemon to control the thinklight (and possibly other lights on your Thinkpad) it comes with the daemon and a control script."
arch=('i686' 'x86_64')
url="http://www.thinkwiki.org/wiki/ThinkLight"
license=('unknown')
depends=('python')
install=$pkgname.install
source=(http://badcode.de/downloads/thinkblinkd-0.1.7.tar.gz)

md5sums=('ec43a566d0973881eb302c72e3d57dcf')

build() {
	cd $srcdir/$pkgname-$pkgver
 	install -Dm644 tbd_tools.py $pkgdir/usr/lib/$pkgname/tbd_tools.py
        install -Dm644 tbd_presets.py $pkgdir/usr/lib/$pkgname/tbd_presets.py
        install -Dm755 thinkblinkd.py $pkgdir/usr/bin/$pkgname.py
        install -Dm755 tbdctrl.py $pkgdir/usr/bin/tbdctrl.py
	
}
