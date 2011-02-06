# Contributor: David Moore <davidm@sjsoft.com>

pkgname=wsgi-jsonrpc
pkgver=0.2.9
pkgrel=2
pkgdesc="WSGI jsonrpc application"
license=('APACHE')
arch=(i686 x86_64)
url="http://code.google.com/p/wsgi-jsonrpc/"
depends=('python')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/w/wsgi-jsonrpc/wsgi-jsonrpc-$pkgver.tar.gz")
md5sums=('927d1ae99490575b0091aaebbd06f4db')

build() {
    cd $srcdir/wsgi-jsonrpc-$pkgver
    python2 setup.py install --root=$pkgdir/ || return 1
}
