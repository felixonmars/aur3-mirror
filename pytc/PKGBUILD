pkgname=pytc
pkgver=0.8
pkgrel=1
pkgdesc="Tokyo Cabinet Python Bindings"
url="http://pypi.python.org/pypi/pytc"
arch=('i686')
license=('BSD')
depends=('tokyocabinet' 'python' 'zlib' 'bzip2')
makedepends=()
provides=('pytc')
source=("http://pypi.python.org/packages/source/p/pytc/pytc-$pkgver.tar.gz")
md5sums=('e656477796edac2fee7eb3d268cb5b28')

build(){
    cd $srcdir/pytc-$pkgver
    python ./setup.py install --root=$pkgdir/
}
