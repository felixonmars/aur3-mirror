# Contributor: Florian Richter <mail@f1ori.de>

pkgname=unittest-xml-reporting
pkgver=1.2
pkgrel=1
pkgdesc="PyUnit-based test runner with JUnit like XML reporting"
arch=(any)
url="https://github.com/danielfm/unittest-xml-reporting"
license=(LGPL)
depends=('python2')
makedepends=('setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/u/unittest-xml-reporting/unittest-xml-reporting-$pkgver.tar.gz)
md5sums=('cc1f1f576ed46c5f5cd127ce99ff1e4a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
