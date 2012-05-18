pkgname=marchanddesable
pkgver=0.2
pkgrel=1
pkgdesc="Turn off your server when you sleep"
url="https://github.com/madjar/marchanddesable"
depends=('python' )
makedepends=('python-distribute' )
license=('ISC')
arch=('any')
source=(http://pypi.python.org/packages/source/m/marchanddesable/${pkgname}-${pkgver}.tar.gz)
md5sums=('32984992b3ea58d33907aa1a25c647e1')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
