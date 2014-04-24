# Maintainer: Scott Dunlop <swdunlop@gmail.com>
# Derived from python-ggplot, by Thomas Weißschuh <thomas t-8ch.de>

pkgname=python2-ggplot
pkgver=0.5.2
pkgrel=1
pkgdesc="ggplot for python2"
arch=('any')
url="https://github.com/yhat/ggplot/"
license=('BSD')
depends=('python2' 'python2-pandas' 'python2-matplotlib' 'python2-statsmodels')
source=("http://pypi.python.org/packages/source/g/ggplot/ggplot-${pkgver}.tar.gz")

build() {
    cd "$srcdir/ggplot-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/ggplot-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
sha256sums=('316bb74ffaf62eed59f2b3b9449c46805fd66f8f37fa48084d970a6ac02d38cd')
