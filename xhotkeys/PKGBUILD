# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: T - rttommy@gmail.com

pkgname=xhotkeys
_pkgname=Xhotkeys
epoch=1
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple and easily configurable hotkey launcher in pygtk. Successor of nongnu xhotkeys"
url="http://code.google.com/p/xhotkeys/"
depends=('pygtk' 'python-xlib' 'python2-configobj' 'kiwi')
makedepends=('make')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://xhotkeys.googlecode.com/files/xhotkeys-0.1.2.tgz)
md5sums=('edaeb79453ed4e9abc4bf0a60de183f8')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root=$pkgdir
}

