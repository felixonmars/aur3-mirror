# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: kytv <killyourtv@i2pmail.org>
pkgname=pythonmock
pkgver=0.8.0
pkgrel=1
pkgdesc="create python mock objects that mimic the interface of classes that unit tests depends on"
arch=('i686' 'x86_64')
url='http://python-mock.sourceforge.net/'
license=('BSD')
depends=('python2')
source=("https://tahoe-lafs.org/source/tahoe-lafs/deps/tahoe-lafs-dep-sdists/mock-$pkgver.tar.gz")
md5sums=('b1ac87a1ceab295aef11dcfc104a7a4a')

build() {
  cd "$srcdir/mock-$pkgver"
  python2 setup.py build
  python2 setup.py test
}

package() {
  cd "$srcdir/mock-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
