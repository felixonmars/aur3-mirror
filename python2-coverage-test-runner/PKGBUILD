# Maintainer: Carlo Teubner <carlo.teubner@gmail.com>

pkgname=python2-coverage-test-runner
pkgver=1.10
pkgrel=1
pkgdesc="Python module for running unit tests while verifying test coverage"
arch=('any')
url="http://liw.fi/coverage-test-runner/"
license=('GPL3')
depends=('python2' 'python2-coverage')
source=("http://code.liw.fi/debian/pool/main/p/python-coverage-test-runner/python-coverage-test-runner_$pkgver.orig.tar.gz")
sha256sums=('550fbffe220007608e6aa41904134321d2fb32af11078cc280fe39d84b251300')

build() {
  cd "$srcdir/CoverageTestRunner-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/CoverageTestRunner-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
