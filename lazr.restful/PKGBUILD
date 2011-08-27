pkgname=lazr.restful
pkgver=0.15.0
pkgrel=1
pkgdesc='Publish data model objects as RESTful web services by annotating their Zope interfaces'
arch=('i686' 'x86_64')
url='https://launchpad.net/lazr.restful'
license='GNU LGPL v3'
depends=('python>=2.5')
makedepends=('python>=2.5')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('a6c7d42af12da4235f87ee4285e47be5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
