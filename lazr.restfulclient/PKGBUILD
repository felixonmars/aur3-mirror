pkgname=lazr.restfulclient
pkgver=0.12.0
pkgrel=2
pkgdesc='A client for lazr.restful-based web services'
arch=('i686' 'x86_64')
url='https://launchpad.net/lazr.restfulclient'
license='GNU LGPL v3'
depends=('lazr.uri' 'python2>=2.7.1' 'python2-httplib2' 'python2-oauth' 'python-simplejson' 'wadllib>=1.1.4' 'zope-interface')
makedepends=('python2>=2.6.6')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('b4df00c20d19b73593b2f959bbbd955f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

