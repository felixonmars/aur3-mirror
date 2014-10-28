# Contributor: masutu <masutu dot arch at gmail dot com>
# Contributor: MTsoul <forums+archlinux at oliverzheng dot com>

pkgname=python-bruce
pkgver=3.2.1
pkgrel=1
pkgdesc="Bruce, the Presentation Tool, puts reStructuredText in your projector."
arch=('any')
url="http://pypi.python.org/pypi/bruce"
license=('BSD')
depends=('python-cocos2d' 'python-docutils')
makedepends=('python-setuptools')
source=(http://bruce-tpt.googlecode.com/files/bruce-$pkgver.tar.gz)
md5sums=('358fe59a477fa507f5ad2918abd9e3db')

build() {
  cd "$srcdir/bruce-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/bruce-$pkgver"
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
