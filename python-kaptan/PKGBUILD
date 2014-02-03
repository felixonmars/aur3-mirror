# Maintainer: Joris Engbers <info at joris engbers dot nl>

_distname=kaptan
pkgname=python-kaptan
pkgver=0.5.7
pkgrel=1
pkgdesc="Python configuration manager"
arch=('any')
url="http://emre.github.io/kaptan/"
license=('BSD')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-${pkgver}.tar.gz)
md5sums=('31beb36b8eb3e94e5657ed14d9d53fde')

package() {
  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 || exit1
}

# vim:set ts=2 sw=2 et:
