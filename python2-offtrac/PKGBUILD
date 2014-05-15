# Maintainer: Akshay Suthar <akshay {dot} suthar {at} gmail {dot} com>
pkgname=python2-offtrac
pkgver=0.1.0
pkgrel=1
pkgdesc="offtrac - A thin wrapper for the bit.ly REST API"
arch=('any')
url="https://pypi.python.org/pypi/offtrac"
license=('BSD')
#groups=()
depends=('python2')
makedepends=('setuptools')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#install=
source=(https://pypi.python.org/packages/source/o/offtrac/offtrac-0.1.0.tar.gz)
md5sums=('6dc1019a2ba05b38dd1eed4c76567744')

package() {
  cd "$srcdir/offtrac-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
