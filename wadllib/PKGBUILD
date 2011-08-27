pkgname=wadllib
pkgver=1.2.0
pkgrel=1
pkgdesc='A Python library for navigating WADL files'
arch=('i686' 'x86_64')
url='https://launchpad.net/wadllib'
license='GNU LGPL v3'
depends=('python2>=2.7.1')
makedepends=('python2>=2.6.6' 'python-distutils-extra')
optdepends=('lazr.uri'
            'python-simplejson')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('2a4aa98b875319839c50fed07876d50f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
