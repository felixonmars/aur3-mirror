# Maintainer : a-sk <askurihin at gmail dot com>

pkgname=python2-connman-dispatcher
pkgver=0.0.8
pkgrel=1
pkgdesc="Call scripts on network changes"
arch=('i686' 'x86_64')
url="http://github.com/a-sk/connman-dispatcher"
license=('MIT')
depends=('python2' 'python2-dbus' 'python2-pyee' 'python2-logbook')
conflicts=('python2-logbook-latest')
source=("https://pypi.python.org/packages/source/c/connman-dispatcher/connman-dispatcher-$pkgver.tar.gz")
md5sums=('24e8114628dcdba6a47360a52e0c9828')

build() {
  cd "$srcdir/connman-dispatcher-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/connman-dispatcher-$pkgver"
  python2 setup.py install --root=$pkgdir
}
