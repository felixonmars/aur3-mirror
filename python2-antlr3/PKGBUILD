pkgname=python2-antlr3
pkgver=3.4
pkgrel=3
pkgdesc="antlr v3,  ANother Tool for Language Recognition, python runtime"
url="http://www.antlr.org/"
depends=()
makedepends=('python2-distribute')
license=('BSD')
arch=('any')
source=("http://www.antlr.org/download/antlr-$pkgver.tar.gz")

package() {
    cd $srcdir/antlr-$pkgver/runtime/Python
    python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('065c14673692db35c83dc26b75223fdb')
