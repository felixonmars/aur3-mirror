# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname=python2-cinderclient
pkgver=1.0.5
pkgrel=1
pkgdesc="OpenStack Block Storage API Client Library"
arch=(any)
url="https://pypi.python.org/pypi/python-cinderclient/"
license=('Apache')
depends=('python2'
         'python2-pbr>=0.5.16'
         'python2-pbr<0.6'
         'python2-prettytable>=0.6'
         'python2-prettytable<0.8'
         'python2-requests>=1.1'
         'python2-simplejson>=2.0.9'
         'python2-six')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/python-cinderclient/python-cinderclient-1.0.5.tar.gz")
md5sums=('4ca18969fd9ac3029c0761d2401bc8bb')

build() {
  cd "python-cinderclient-$pkgver"
  /usr/bin/python2 setup.py build
}

package() {
  cd "$srcdir/python-cinderclient-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
