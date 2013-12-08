# Maintainer: Adam Wolk <netprobe at gmail dot com>
_name=datetime_truncate
pkgname=python2-${_name}
pkgver=1.0.1
pkgrel=1
pkgdesc="Truncate datetime objects to a set level of precision"
arch=('any')
url="https://github.com/mediapop/datetime_truncate"
license=('BSD') # not included by the author, just marked in setup.py
makedepends=('python2-setuptools')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('5f09c9243d0a2fbbd71944bff18d2995')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # No license file from the author
  #install -D /usr/share/licenses/common/${license}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
