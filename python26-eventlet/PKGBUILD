# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-eventlet
_pkgname=eventlet
pkgver=0.9.15
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Python library for seamless coroutine-based concurrency"
url="http://www.eventlet.net"
license=('MIT')
depends=('python26' 'python26-greenlet')
makedepends=('python26-distribute')
source=("http://pypi.python.org/packages/source/e/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('3d08f73418e87348de9fbeb3a0f2ddc8')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir" --optimize=1
}
