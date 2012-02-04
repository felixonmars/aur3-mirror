pkgname=lazr.uri
pkgver=1.0.2
pkgrel=2
pkgdesc='A self-contained, easily reusable library for parsing, manipulating, and generating URIs'
arch=('i686' 'x86_64')
url='https://launchpad.net/lazr.uri'
license='GNU LGPL v3'
depends=('python>=2.5')
makedepends=('python>=2.5')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('18e4161f337f17a81baca25f3b7bc947')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
