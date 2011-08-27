# Contributor: David Moore <davidm@sjsoft.com>

pkgname=wsgi-xmlrpc
pkgver=0.2.8
pkgrel=1
pkgdesc="WSGI xmlrpc application"
license=('APACHE')
arch=(i686 x86_64)
url="http://code.google.com/p/wsgi-xmlrpc/"
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('974038d73c48ee8f993ab64aad2195c1')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root=$pkgdir
}
