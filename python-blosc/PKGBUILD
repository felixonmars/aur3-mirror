pkgname=python-blosc
pkgver=1.2.4
pkgrel=1
pkgdesc="Blosc is a high performance compressor optimized for binary data."
url="http://github.com/FrancescAlted/python-blosc"
arch=('i686' 'x86_64')
license=('MIT')
depends=( 'python')
source=(http://pypi.python.org/packages/source/b/blosc/blosc-$pkgver.tar.gz)
md5sums=('3165ce4c3315225f1cde5dd61e8d84a3')

build() {
    cd $srcdir/blosc-$pkgver

    python setup.py build
}

package() {
    cd $srcdir/blosc-$pkgver

    python setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1

    install -D $srcdir/blosc-$pkgver/LICENSES/BLOSC.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
