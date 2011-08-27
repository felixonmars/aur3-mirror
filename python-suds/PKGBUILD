# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=python-suds
pkgver=0.4
pkgrel=3
pkgdesc="A lightweight SOAP python client."
arch=('any')
url="https://fedorahosted.org/suds/"
license=('LGPL')
depends=('python2')
makedepends=('python2-distribute')
source=("https://fedorahosted.org/releases/s/u/suds/python-suds-${pkgver}.tar.gz")
md5sums=('05523dfd3fc0de3f19dde4aca5dd17e9')

build() {
  cd "${srcdir}/python-suds-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-suds-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
