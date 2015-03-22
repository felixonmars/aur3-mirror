# Maintainer: Ashley Whetter <(firstname) at awhetter couk>
pkgname=('python2-pastedeploy' 'python-pastedeploy')
pkgbase=python-pastedeploy
pkgver=1.5.2
pkgrel=1
pkgdesc="Load, configure, and compose WSGI applications and servers"
arch=(any)
url="https://pypi.python.org/pypi/PasteDeploy"
license=('MIT')
depends=()
makedepends=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/P/PasteDeploy/PasteDeploy-${pkgver}.tar.gz)
md5sums=(352b7205c78c8de4987578d19431af3b)

package_python-pastedeploy() {
  depends=('python')
  makedepends=('python-setuptools')

	cd "$srcdir/PasteDeploy-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pastedeploy() {
  depends=('python2')
  makedepends=('python2-setuptools')

	cd "$srcdir/PasteDeploy-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
