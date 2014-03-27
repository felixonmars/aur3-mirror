# Contributor: feilen <feilen1000@gmail.com>
# Contributor: Tom Tryfonidis <tomtryf@gmail.com>

pkgname=python2-sockjs-tornado
pkgver=1.0.0
pkgrel=1
pkgdesc="SockJS-tornado is a Python server side counterpart of SockJS-client browser library running on top of Tornado framework."
arch=('any')
url="https://github.com/mrjoes/sockjs-tornado"
license=('MIT')
depends=( 'python2' 'python2-tornado' )
source=(https://codeload.github.com/mrjoes/sockjs-tornado/tar.gz/v1.0.0)
md5sums=('a6b606d4ef9fbd920fcc431ca84ae820')

package() {
	cd "$srcdir/sockjs-tornado-$pkgver"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
