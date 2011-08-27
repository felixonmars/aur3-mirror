# Contributor: David Moore <davidm@sjsoft.com>

pkgname=wsgi-fileserver
pkgver=0.2.8
pkgrel=1
pkgdesc="WSGI fileserver application"
license=('APACHE')
arch=(i686 x86_64)
url="http://code.google.com/p/wsgi-fileserver/"
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/w/wsgi-fileserver/wsgi-fileserver-$pkgver.tar.gz")
md5sums=('0c6f2c7ebd5f457d85ffd4e4c1a6a6b1')

build() {
    cd $srcdir/wsgi-fileserver-$pkgver
    python2 setup.py install --root=$pkgdir
}
