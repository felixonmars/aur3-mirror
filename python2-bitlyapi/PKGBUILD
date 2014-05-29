# Maintainer: Akshay Suthar <akshay {dot} suthar {at} gmail {dot} com>
pkgname=python2-bitlyapi
pkgver=0.1.1
pkgrel=3
pkgdesc="bitlyapi - A thin wrapper for the bit.ly REST API"
arch=('any')
url="https://pypi.python.org/pypi/bitlyapi"
license=('BSD')
#groups=()
depends=('python2' 'python2-simplejson')
makedepends=('setuptools')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#install=
source=(https://pypi.python.org/packages/source/b/bitlyapi/bitlyapi-0.1.1.tar.gz)
sha256sums=('fb074088bcefe884d7dd61165185486597f394b72b862090485d8bf3305be44f')

package() {
  cd "$srcdir/bitlyapi-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


# vim:set ts=2 sw=2 et:
