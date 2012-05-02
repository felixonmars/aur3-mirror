pkgname=marchanddesable
pkgver=0.1
pkgrel=1
pkgdesc="Turn off your server when you sleep"
url="https://github.com/madjar/marchanddesable"
depends=('python' )
makedepends=('python-distribute' )
license=('ISC')
arch=('any')
source=('http://pypi.python.org/packages/source/m/marchanddesable/marchanddesable-0.1.tar.gz')
md5sums=('4f0d45d79fcf094dd842449bc0feb998')

build() {
    cd $srcdir/marchanddesable-0.1
    python setup.py build
}

package() {
    cd $srcdir/marchanddesable-0.1
    python setup.py install --root="$pkgdir" --optimize=1
}
