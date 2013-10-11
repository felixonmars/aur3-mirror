# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname=python2-neutronclient
_pypiname=python-neutronclient
pkgver=2.3.1
pkgrel=1
pkgdesc="CLI and Client Library for OpenStack Networking"
arch=(any)
url="https://pypi.python.org/pypi/${_pypiname}/"
license=('Apache')
depends=('python2'
         'python2-babel>=0.9.6'
         'python2-cliff>=1.4.3'
         'python2-httplib2'
         'python2-iso8601>=0.1.4'
         'python2-pbr>=0.5.21'
         'python2-pbr<1.0'
         'python2-simplejson>=2.0.9'
         'python2-six')
optdepends=('bash-completion')
makedepends=('python2-setuptools')
conflicts=('python2-quantumclient')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('5417f1695280bd32d0dd8127bc37fb27')

build() {
  cd "${_pypiname}-${pkgver}"
  /usr/bin/python2 setup.py build
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  /usr/bin/python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D -m 644 tools/neutron.bash_completion etc/base_completion.d/neutron
}

# vim:set ts=2 sw=2 et:
