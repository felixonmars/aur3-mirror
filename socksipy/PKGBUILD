# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=socksipy
pkgver=1.00
pkgrel=4
pkgdesc="Provides a socket-like interface that supports connections to any TCP service through the use of a SOCKS4, SOCKS5 or HTTP proxy. "
arch=('any')
license=('BSD')
url="http://socksipy.sourceforge.net/"
depends=('python2')
source=("http://downloads.sourceforge.net/project/socksipy/socksipy/SocksiPy%20${pkgver}/SocksiPy.tar.gz")
md5sums=('3be8be26230bc9eca94eb3335740ed5e')

build() {
	_site_packages=$(python2 -sSc 'import site; print site.getsitepackages()[0]')
	install -Dm644 socks.py "${pkgdir}$_site_packages/socks.py"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
