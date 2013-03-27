# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=wadllib
pkgname=python2-wadllib
pkgver=1.3.2
pkgrel=1
pkgdesc="The Web Application Description Language is an XML vocabulary for describing the capabilities of HTTP resources. wadllib can be used in conjunction with an HTTP library to navigate and manipulate those resources"
arch=('any')
url="https://launchpad.net/wadllib"
license=('LGPL')
depends=('python2-lazr-uri' 'python2-simplejson')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('b78902ee7fda49ae50e5acc1bb0298f9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
