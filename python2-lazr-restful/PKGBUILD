pkgname=python2-lazr-restful
_pkgname=lazr.restful
pkgver=0.19.9
pkgrel=1
pkgdesc='Publish data model objects as RESTful web services by annotating their Zope interfaces'
arch=('i686' 'x86_64')
url='https://launchpad.net/lazr.restful'
license='GNU LGPL v3'
depends=('python>=2.5')
makedepends=('python>=2.5')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('82891bd0bd76abe54c8830ba8588201d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
