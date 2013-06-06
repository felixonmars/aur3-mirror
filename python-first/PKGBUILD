# Maintainer: Sébastien Luttringer
pkgname=python-first
pkgver=2.0.0
pkgrel=1
pkgdesc='Simple function that returns the first true value from an iterable'
arch=('any')
url='https://pypi.python.org/pypi/first/2.0.0'
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/first/first-$pkgver.tar.gz")
md5sums=('894015e227d749f9f02b43b6d337cc3c')

package() {
  cd first-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
