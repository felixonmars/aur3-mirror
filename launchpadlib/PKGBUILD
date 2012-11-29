# Maintainer: Jon Nordby <jononor@gmail.com>
# Contributor: Alexandre Courbot <gnurou@gmail.com>

pkgname=launchpadlib
pkgver=1.10.2
pkgrel=1
pkgdesc='A free Python library for scripting Launchpad through its web services interface'
arch=('i686' 'x86_64')
url='https://launchpad.net/launchpadlib'
license=('LGPL3')
depends=('python>=2.5' 'python2-lazr-restful' 'python2-lazr-uri' 'python2-lazr-restfulclient' 'python2-keyring')
makedepends=('python>=2.5')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('d266da1aa19dbf8473c1e339e8b112e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
