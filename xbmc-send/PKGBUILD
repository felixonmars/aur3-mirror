# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=xbmc-send
pkgver=13.0
_pkgname=Gotham
pkgrel=1
pkgdesc='Event client tool to control XBMC from the CLI.'
arch=('any')
url='https://github.com/xbmc/xbmc/tree/master/tools/EventClients'
license=('GPL')
depends=('python2')
conflicts=('xbmc-eventclient-xbmc-send' 'xbmctools-git')
source=("https://github.com/xbmc/xbmc/archive/$pkgver-$_pkgname.tar.gz")
sha256sums=('5d56609f6a02d6c34fec3b3ef7563a8e473b82d7be27eeaf2706858b918dd024')

package() {
	cd "xbmc-$pkgver-$_pkgname/tools/EventClients"
	sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|' Clients/XBMC\ Send/xbmc-send.py
	install -Dm755 Clients/XBMC\ Send/xbmc-send.py "$pkgdir/usr/bin/xbmc-send"
	install -Dm644 lib/python/xbmcclient.py "$pkgdir/usr/lib/python2.7/site-packages/xbmcclient.py"
}
