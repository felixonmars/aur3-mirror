# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname=python2-ceilometerclient
_pypiname=python-ceilometerclient
pkgver=1.0.10
pkgrel=1
pkgdesc="OpenStack Telemetry API Client Library"
arch=(any)
url="https://pypi.python.org/pypi/python-ceilometerclient/"
license=('Apache')
depends=('python2'
         'python2-iso8601>=0.1.9'
         'python2-keystoneclient>=0.6.0'
         'python2-pbr<1.0'
         'python2-pbr>=0.6'
         'python2-prettytable<0.8'
         'python2-prettytable>=0.7'
         'python2-six>=1.5.2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('5351dfb63df8c0084dee331b4f851a97')

build() {
  cd "$_pypiname-$pkgver"
  /usr/bin/python2 setup.py build
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: sw=2 sts=2 et
