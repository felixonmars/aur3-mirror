# Contributer: fnord0 <fnord0 AT riseup DOT net>
pkgname=python-clientform
_pkgname=ClientForm
pkgver=0.2.10
pkgrel=2
pkgdesc="A Python module for handling, parsing, and filling in HTML forms on the client side"
arch=('any')
url="http://pypi.python.org/pypi/ClientForm"
license=('BSD')
depends=('python')
source="http://pypi.python.org/packages/source/C/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
md5sums=('832c0ca78674f9263d1fc5fab8756e66')
sha1sums=('e0228e8a6b65dad8457266831fbce84daf3588bd')

build() {
	  cd ${srcdir}/${_pkgname}-${pkgver}
	  python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
}
