# Maintainer: Jon Nordby <jononor@gmail.com>

# Provides the peak.util.decorators module

pkgname=python2-decoratortools
_pkgname=DecoratorTools
pkgver=1.8
pkgrel=1
pkgdesc="Class, function, and metaclass decorators"
arch=('any')
url="http://pypi.python.org/pypi/DecoratorTools"
license=('GPL')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/D/DecoratorTools/DecoratorTools-$pkgver.zip)
md5sums=(f161004115c3d04ed976c230c8a91d87)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
