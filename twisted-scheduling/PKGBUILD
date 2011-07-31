# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

pkgname=twisted-scheduling
pkgver=1.0
pkgrel=1
pkgdesc="A scheduling plugin for Twisted."
arch=('i386' 'x86_64')
url="http://pypi.python.org/pypi/twisted.scheduling"
license=('APACHE')
depends=('twisted' 'python2')
source=("http://pypi.python.org/packages/source/t/twisted.scheduling/twisted.scheduling-1.0.tar.gz")
md5sums=('e200ff79ea75a65bfc7b4ac659fc1c64')

build() {
  cd "$srcdir/twisted.scheduling-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}

