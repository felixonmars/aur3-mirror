# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=flickrapi
pkgver=1.4.2
pkgrel=3
pkgdesc="The official Python interface to the Flickr API"
arch=('any')
url="http://stuvel.eu/flickrapi"
license=('Python')
depends=('python2')
makedepends=('docutils' 'unzip')
source=(http://pypi.python.org/packages/source/f/$pkgname/$pkgname-$pkgver.zip)
md5sums=('90dca08a45968b18da0894887f3e59b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  rm -r $pkgdir/usr/{README,LICENSE,UPGRADING}
}
