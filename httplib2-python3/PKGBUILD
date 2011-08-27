# Contributor: Preecha Patumchareonpol <yumyai in gmail.com> 

pkgname=httplib2-python3
pkgver=0.5.0
pkgrel=1
pkgdesc="A comprehensive HTTP client library, supporting many features"
arch=('i686' 'x86_64')
url="http://code.google.com/p/httplib2/"
license=('MIT')
depends=(python3)
source=(http://httplib2.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('ecc9eae627791f8ca6c4f7833e15e76d')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir \
  --install-purelib "/usr/lib/python3.1/site-packages/"
}
